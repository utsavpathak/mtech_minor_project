import psycopg2
import pandas as pd
from datetime import datetime

def execute_queries(connection, cursor, file_path, result_file_path):
    with open(file_path, 'r') as file:
        queries = file.read().split(';')

        results = []  # To store query results along with execution time

        for query in queries:
            if query.strip():  # Skip empty lines
                start_time = datetime.now()

                cursor.execute(query)
                result = cursor.fetchall()

                end_time = datetime.now()
                execution_time = (end_time - start_time).total_seconds() * 1000  # Convert to milliseconds

                results.append({
                    "Query": query,
                    "Result": result,
                    "ExecutionTime(ms)": execution_time
                })

                connection.commit()

        # Write results to Excel file
        df = pd.DataFrame(results)
        df.to_excel(result_file_path, index=False)

if __name__ == "__main__":
    # Update the following information with your PostgreSQL database details
    db_params = {
        "host": "localhost",
        "database": "tpch",
        "user": "postgres",
        "password": "utsav123",
        "port": "5432"
    }

    file_path = "queries.txt"  # Update with the path to your text file
    result_file_path = "result.xlsx"  # Output Excel file

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

