import psycopg2

def execute_queries(connection, cursor, file_path, result_file_path):
    with open(file_path, 'r') as file:
        queries = file.read().split(';')

        for query in queries:
            if query.strip():  # Skip empty lines
                cursor.execute(query)
                result = cursor.fetchall()

                with open(result_file_path, 'a') as result_file:
                    result_file.write(f"Query: {query}\n")
                    result_file.write(f"Result: {result}\n")
                    result_file.write("\n")

                connection.commit()

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
    result_file_path = "result.txt"

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

