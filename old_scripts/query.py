import psycopg2
import configparser

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
    config = configparser.ConfigParser()
    config.read("config.ini")  # Read configuration from config.ini

    db_params = {
        "host": config["postgres"]["host"],
        "database": config["postgres"]["database"],
        "user": config["postgres"]["user"],
        "password": config["postgres"]["password"],
        "port": config["postgres"]["port"]
    }

    file_path = config["files"]["queries_file"]
    result_file_path = config["files"]["result_file"]

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
