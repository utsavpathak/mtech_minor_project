import psycopg2
import configparser
import csv
import json
import sqlparse
from collections import OrderedDict
import subprocess

def extract_cardinality(plan, level=1, parent=None):
    cardinality = plan.get('Actual Rows', None)
    loop = plan.get('Actual Loops',1)
    results = OrderedDict({
        f'level_{level}_input_cardinality{parent}': cardinality * loop
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

# Read configuration from the config file
config = configparser.ConfigParser()
config.read('feature_config.ini')

# Establish database connection
db_params = config['postgres']
conn = psycopg2.connect(
    host=db_params['host'],
    database=db_params['database'],
    user=db_params['user'],
    password=db_params['password'],
    port=db_params['port']
)

# Get file paths
file_params = config['files']
queries_file = file_params['queries_file']
result_file = file_params['csv_file']




# Open the CSV file for writing
with open(result_file, 'w', newline='') as result_csv_file:
    csv_writer = csv.writer(result_csv_file)

    # Open and execute queries from the queries file
    with open(queries_file, 'r') as queries_file:
        max_cardinality_levels = 0  # Track the maximum number of cardinality levels
        query_id = 1  # Initialize query ID counter

        for query in queries_file.read().split(';'):
            query = query.strip()
            if query:
                cur = conn.cursor()

                # Execute EXPLAIN ANALYZE to get the query plan
                cur.execute(f"EXPLAIN (ANALYZE, FORMAT JSON) {query}")
                result = cur.fetchone()[0]

                # Check if result is a list and get the first element
                if isinstance(result, list) and result:
                    result = result[0]

                # Access the 'Plan' key from the dictionary
                plan = result.get('Plan', {})

                # Extract the input cardinality
                cardinalities = extract_cardinality(plan)

                # Update max_cardinality_levels if necessary
                max_cardinality_levels = max(max_cardinality_levels, len(cardinalities))

                cur.close()

        # Rewrite the header row with input cardinality columns
        header = ["id", "Original Query","mean_power", "Node Type", "Parallel Aware", "Startup Cost", "Total Cost", "Plan Rows",
                  "Plan Width", "Actual Startup Time", "Actual Total Time", "Actual Rows", "Actual Loops",
                  "Base Cardinality", "Output Cardinality"]
        for i in range(1, max_cardinality_levels + 1):
            header.append(f"Input Cardinality Level {i}")

        # Write the header row
        csv_writer.writerow(header)

        subprocess.run(["python3", "power_measure.py"])  # Execute tool.py

        # Execute queries again to write to the CSV file
        queries_file.seek(0)  # Reset file pointer to the beginning
        for query in queries_file.read().split(';'):
            query = query.strip()
            if query:
                cur = conn.cursor()

                # Execute EXPLAIN ANALYZE to get the query plan
                cur.execute(f"EXPLAIN (ANALYZE, FORMAT JSON) {query}")
                result = cur.fetchone()[0]

                # Check if result is a list and get the first element
                if isinstance(result, list) and result:
                    result = result[0]

                # Access the 'Plan' key from the dictionary
                plan = result['Plan']
                node_type = plan.get('Node Type', '')
                parallel_aware = plan.get('Parallel Aware', '')
                startup_cost = plan.get('Startup Cost', '')
                total_cost = plan.get('Total Cost', '')
                plan_rows = plan.get('Plan Rows', '')
                plan_width = plan.get('Plan Width', '')
                actual_startup_time = plan.get('Actual Startup Time', '')
                actual_total_time = plan.get('Actual Total Time', '')
                actual_rows = plan.get('Actual Rows', '')
                actual_loops = plan.get('Actual Loops', '')

                # Extract the input cardinality
                cardinalities = extract_cardinality(plan)

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

                # Call tool.py to generate power data
                

                # Read mean power for the query from the mean_power CSV file
                config = configparser.ConfigParser()
                config.read('feature_config.ini')
                mean_power_file = config['files']['mean_file']
                with open(mean_power_file, 'r') as mean_file:
                    csv_reader = csv.reader(mean_file)
                    for row in csv_reader:
                        if row and row[0].isdigit():  # Check if row[0] is a digit (query ID)
                            if int(row[0]) == query_id:
                                mean_power = float(row[2])
                                break

                # Write data row to CSV with ID
                csv_writer.writerow([query_id, query,mean_power, node_type, parallel_aware, startup_cost, total_cost, plan_rows,
                                     plan_width, actual_startup_time, actual_total_time, actual_rows, actual_loops,
                                     base_cardinality, output_cardinality] + list(cardinalities.values()))

                cur.close()
                query_id += 1  # Increment query ID counter

# Close the database connection
conn.close()

