import configparser
import psycopg2
import csv

# Parse the configuration file
config = configparser.ConfigParser()
config.read('feature_config.ini')

# Get the Postgres and file parameters
db_params = config['postgres']
file_params = config['files']

# Connect to the database
conn = psycopg2.connect(
    host=db_params['host'],
    database=db_params['database'],
    user=db_params['user'],
    password=db_params['password'],
    port=db_params['port']
)

# Open a cursor to perform database operations
cur = conn.cursor()

# Open the queries file and the result CSV file
with open(file_params['queries_file'], 'r') as queries_file, open(file_params['result_file'], 'w', newline='') as result_file:
    csv_writer = csv.writer(result_file)
    csv_writer.writerow(['query', 'output_cardinality'])  # Write the header

    # Read the queries and execute them one by one
    for query in queries_file.read().split(';'):
        query = query.strip()  # Remove leading/trailing whitespace
        if query:  # Skip empty queries
            cur.execute(query)
            output_cardinality = cur.rowcount  # Get the number of rows returned
            csv_writer.writerow([query, output_cardinality])  # Write to the CSV file

# Close the cursor and the connection
cur.close()
conn.close()
