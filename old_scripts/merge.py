import psycopg2
import configparser
import csv
import json
import sqlparse
from collections import OrderedDict

def extract_cardinality(plan, level=1, parent=None):
    cardinality = plan.get('Actual Rows', None)
    results = OrderedDict({
        f'level_{level}inputcardinality{parent}': cardinality
    })
    if 'Plans' in plan:
        for i, subplan in enumerate(plan['Plans']):
            results.update(extract_cardinality(subplan, level=level+1, parent=f'{parent}_{i}' if parent else str(i)))
    return results

def get_table_names(query):
    parsed = sqlparse.parse(query)
    tables = []
    from_seen = False
    group_by_seen = False
    order_by_seen = False

    for statement in parsed:
        for token in statement.tokens:
            if from_seen and not group_by_seen and not order_by_seen:
                if isinstance(token, sqlparse.sql.Identifier):
                    table_name = token.get_real_name()
                    if table_name:
                        tables.append(table_name)
                elif isinstance(token, sqlparse.sql.IdentifierList):
                    for identifier in token.get_identifiers():
                        if isinstance(identifier, sqlparse.sql.Identifier):
                            table_name = identifier.get_real_name()
                            if table_name:
                                tables.append(table_name)
            if token.ttype is sqlparse.tokens.Keyword:
                keyword_value = token.value.upper()
                if keyword_value == 'FROM' or keyword_value == 'JOIN':
                    from_seen = True
                elif keyword_value == 'GROUP BY':
                    group_by_seen = True
                elif keyword_value == 'ORDER BY':
                    order_by_seen = True

    return tables

# Parse the configuration file
config = configparser.ConfigParser()
config.read('feature_config.ini')

# Get the database connection parameters
db_params = config['postgres']
conn = psycopg2.connect(
    host=db_params['host'],
    database=db_params['database'],
    user=db_params['user'],
    password=db_params['password'],
    port=db_params['port']
)

# Get the file paths
file_params = config['files']
queries_file = file_params['queries_file']
result_file = file_params['result_file']


# Open the queries file and the result CSV file
with open(queries_file, 'r') as queries_file, open(result_file, 'w', newline='') as result_csv_file:
    csv_writer = csv.writer(result_csv_file)
    header = ['query', 'base_cardinality', 'output_cardinality']
    
    # Read the queries and execute them one by one
    for query in queries_file.read().split(';'):
        query = query.strip()  # Remove leading/trailing whitespace
        if query:  # Skip empty queries
            cur = conn.cursor()
            cur.execute(f"EXPLAIN (ANALYZE, FORMAT JSON) {query}")
            result = cur.fetchone()[0]
            # Extract the input cardinality from the result
            cardinalities = extract_cardinality(result[0]['Plan'])
            # Calculate the base cardinality
            tables = get_table_names(query)
            base_cardinality = 0
            for table in tables:
                cur.execute(f'SELECT COUNT(*) FROM {table}')
                count = cur.fetchone()[0]
                base_cardinality += count
            # Get the number of rows returned
            cur.execute(query)
            output_cardinality = cur.rowcount
            # Dynamically extend the header based on the input cardinality levels
            # header.extend([f'level_{i}_inputcardinality' for i in range(1, len(cardinalities) + 1)])
            cur.close()

    # Write the header rows for cardinality levels
    # csv_writer.writerow(header)
    csv_writer.writerow(['query', 'base_cardinality', 'output_cardinality'] + [f'Input_Level{i}' for i in range(1, len(cardinalities) + 1)])

    # Read the queries and execute them one by one
    queries_file.seek(0)  # Reset file pointer to beginning
    for query in queries_file.read().split(';'):
        query = query.strip()  # Remove leading/trailing whitespace
        if query:  # Skip empty queries
            cur = conn.cursor()
            cur.execute(f"EXPLAIN (ANALYZE, FORMAT JSON) {query}")
            result = cur.fetchone()[0]
            # Extract the input cardinality from the result
            cardinalities = extract_cardinality(result[0]['Plan'])
            # Calculate the base cardinality
            tables = get_table_names(query)
            base_cardinality = 0
            for table in tables:
                cur.execute(f'SELECT COUNT(*) FROM {table}')
                count = cur.fetchone()[0]
                base_cardinality += count
            # Get the number of rows returned
            cur.execute(query)
            output_cardinality = cur.rowcount
            # Write data rows
            csv_writer.writerow([query, base_cardinality, output_cardinality] + list(cardinalities.values()))
            cur.close()

# Close the database connection
conn.close()