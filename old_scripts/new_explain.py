import psycopg2
import configparser
import csv

def read_config(filename):
    config = configparser.ConfigParser()
    config.read(filename)
    return config

def execute_query(query, config):
    connection = psycopg2.connect(
        host=config['postgres']['host'],
        database=config['postgres']['database'],
        user=config['postgres']['user'],
        password=config['postgres']['password'],
        port=config['postgres']['port']
    )
    cursor = connection.cursor()
    cursor.execute(query)
    result = cursor.fetchall()
    cursor.close()
    connection.close()
    return result

def main():
    config = read_config('feature_config.ini')
    queries_file = config['files']['queries_file']
    result_file = config['files']['result_file']

    with open(queries_file, 'r') as f:
        queries = f.read().split(';')

    with open(result_file, 'w', newline='') as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(['Query', 'Input Cardinality', 'Base Cardinality', 'Output Cardinality'])

        for query in queries:
            query = query.strip()
            if query:
                # Execute EXPLAIN ANALYZE to get cardinality
                explain_query = f"EXPLAIN ANALYZE {query}"
                execution_result = execute_query(explain_query, config)

                # Parse the execution result to find cardinality
                input_cardinality = base_cardinality = output_cardinality = 'N/A'
                for line in execution_result:
                    line_str = line[0]

                    # Parsing input cardinality
                    if 'actual time' in line_str and 'rows=' in line_str:
                        input_cardinality = line_str.split("rows=")[-1].split(" ")[0]

                    # Parsing base cardinality
                    if 'actual time' in line_str and 'actual rows=' in line_str:
                        base_cardinality = line_str.split("actual rows=")[-1].split(" ")[0]

                    # Parsing output cardinality
                    if 'actual time' in line_str and 'rows=' in line_str and 'loops=' in line_str:
                        output_cardinality = line_str.split("rows=")[-1].split(" ")[0]

                # Write the results to CSV
                csvwriter.writerow([query, input_cardinality, base_cardinality, output_cardinality])

    print("Query analysis completed. Results stored in", result_file)

if __name__ == "__main__":
    main()
