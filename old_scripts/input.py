import psycopg2
import csv
import configparser
import json
from collections import OrderedDict

def extract_cardinality(plan, level=1, parent=None):
    cardinality = plan.get('Actual Rows', None)
    results = OrderedDict({
        f'input_cardinality_level_{level}_{parent}': cardinality
    })
    if 'Plans' in plan:
        for i, subplan in enumerate(plan['Plans']):
            results.update(extract_cardinality(subplan, level=level+1, parent=f'{parent}_{i}' if parent else str(i)))
    return results

# Read the configuration file
config = configparser.ConfigParser()
config.read('feature_config.ini')

# Get the Postgres and file parameters
pg_params = config['postgres']
file_params = config['files']

# Connect to the PostgreSQL database
conn = psycopg2.connect(
    host=pg_params['host'],
    database=pg_params['database'],
    user=pg_params['user'],
    password=pg_params['password'],
    port=pg_params['port']
)

# Open a cursor to perform database operations
cur = conn.cursor()

# Read the queries from the input file
with open(file_params['queries_file'], 'r') as f:
    queries = f.read().split(';')

# Prepare a list for storing the results
results = []

# Process each query
for query in queries:
    # Skip if the query is empty
    if not query.strip():
        continue

    # Run the EXPLAIN ANALYZE command
    cur.execute(f"EXPLAIN (ANALYZE, FORMAT JSON) {query}")
    result = cur.fetchone()[0]

    # Extract the input cardinality from the result
    cardinalities = extract_cardinality(result[0]['Plan'])

    # Store the result in the list
    row = OrderedDict({'query': query})
    row.update(cardinalities)
    results.append(row)

# Get all fieldnames from the results
fieldnames = list(OrderedDict.fromkeys(field for row in results for field in row))

# Prepare the CSV file for writing the results
with open(file_params['result_file'], 'w', newline='') as csvfile:
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()

    # Write the results to the CSV file
    for row in results:
        writer.writerow(row)

# Close the cursor and the connection
cur.close()
conn.close()