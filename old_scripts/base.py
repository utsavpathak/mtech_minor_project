import psycopg2
import configparser
import sqlparse
import csv

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

# Function to get table names from a query
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



# Read the queries from the input file
with open(queries_file, 'r') as f:
    queries = f.read().split(';')

# Execute each query and calculate the base cardinality
with open(result_file, 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerow(['Query', 'Base Cardinality'])
    for query in queries:
        if query.strip() == '':
            continue
        tables = get_table_names(query)
        print(f'Identified tables for query: {tables}')  # Print the identified tables
        base_cardinality = 0
        with conn.cursor() as cur:
            for table in tables:
                cur.execute(f'SELECT COUNT(*) FROM {table}')
                count = cur.fetchone()[0]
                base_cardinality += count
            writer.writerow([query, base_cardinality])

# Close the database connection
conn.close()
