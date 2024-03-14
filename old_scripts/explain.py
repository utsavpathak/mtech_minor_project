import psycopg2
import configparser
import csv
import re
import json

# def execute_queries(connection, cursor, file_path, result_file_path):
#     with open(file_path, 'r') as file:
#         queries = file.read().split(';')

#     with open(result_file_path, 'w', newline='') as result_file:
#         writer = csv.writer(result_file)
#         writer.writerow(["Original Query", "Seq Scan", "Planning Time (ms)", "Execution Time (ms)"])

#         for query in queries:
#             original_query = query.strip()              
#             if original_query:  # Skip empty lines
#                 print(f"Executing query: {original_query}")  # Debug print
#                 cursor.execute(f"EXPLAIN (ANALYZE) {original_query}")
#                 result = cursor.fetchall()

#                 seq_scan = None
#                 planning_time = None
#                 execution_time = None

#                 for row in result:
#                     if "Seq Scan" in row[0]:
#                         seq_scan = row[0]
#                     elif "Planning Time" in row[0]:
#                         planning_time = re.search(r'\d+.\d+', row[0]).group()
#                     elif "Execution Time" in row[0]:
#                         execution_time = re.search(r'\d+.\d+', row[0]).group()

#                 print(f"Writing row: {original_query}, {seq_scan}, {planning_time}, {execution_time}")  # Debug print
#                 writer.writerow([original_query, seq_scan, planning_time, execution_time])

#                 connection.commit()

# def execute_queries(connection, cursor, file_path, result_file_path):
#     with open(file_path, 'r') as file:
#         queries = file.read().split(';')

#     with open(result_file_path, 'w', newline='') as result_file:
#         writer = csv.writer(result_file)
#         writer.writerow(["Original Query", "Explain Analyze Output"])

#         for query in queries:
#             original_query = query.strip()              
#             if original_query:  # Skip empty lines
#                 print(f"Executing query: {original_query}")  # Debug print
#                 cursor.execute(f"EXPLAIN (ANALYZE) {original_query}")
#                 result = cursor.fetchall()

#                 explain_analyze_output = "\n".join([row[0] for row in result])

#                 print(f"Writing row: {original_query}, {explain_analyze_output}")  # Debug print
#                 writer.writerow([original_query, explain_analyze_output])

#                 connection.commit()

def execute_queries(connection, cursor, file_path, result_file_path):
    with open(file_path, 'r') as file:
        queries = file.read().split(';')

    with open(result_file_path, 'w', newline='') as result_file:
        writer = csv.writer(result_file)
        # Write the header row
        writer.writerow(["Original Query", "Node Type", "Parallel Aware", "Startup Cost", "Total Cost", "Plan Rows", "Plan Width", "Actual Startup Time", "Actual Total Time", "Actual Rows", "Actual Loops", "Misc Details"])

        for query in queries:
            original_query = query.strip()
            if original_query:  # Skip empty lines
                print(f"Executing query: {original_query}")  # Debug print
                cursor.execute(f"EXPLAIN (ANALYZE, FORMAT JSON) {original_query}")
                result = cursor.fetchone()[0][0]  # Fetch the first row and get the JSON data
                print("Result type:", type(result))
                print("Result:", result)

                # Uncomment if result is a string representation of JSON
                # result = json.loads(result)

                plan = result['Plan']
                # Extract the details from the plan
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
                misc_details = plan.get('Misc', '')

                # Write the details to the CSV file
                writer.writerow([original_query, node_type, parallel_aware, startup_cost, total_cost, plan_rows, plan_width, actual_startup_time, actual_total_time, actual_rows, actual_loops, misc_details])
                connection.commit()

if __name__ == "__main__":
    config = configparser.ConfigParser()
    config.read("feature_config.ini")  # Read configuration from config.ini

    db_params = {
        "host": config["postgres"]["host"],
        "database": config["postgres"]["database"],
        "user": config["postgres"]["user"],
        "password": config["postgres"]["password"],
        "port": config["postgres"]["port"]
    }

    file_path = config["files"]["queries_file"]
    result_file_path = config["files"]["csv_file"]

    try:
        connection = psycopg2.connect(**db_params)
        cursor = connection.cursor()

        execute_queries(connection, cursor, file_path, result_file_path)

        print("Queries executed successfully!")

    except Exception as e:
        print(f"Error: {e}")

    finally:
        if connection:
            connection.close()
            print("Connection closed.")