import psycopg2
import configparser
import csv
import json
import sqlparse

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

def extract_features(plan, query_index, query, level=1, parent=None, node_num=1):
    loop = plan.get('Actual Loops', 1)
    
    # Extract input cardinality
    if 'Plans' in plan:
        # For parent nodes, set input cardinality to be the sum of the output cardinalities of their child nodes
        input_cardinality = sum(child.get('Actual Rows', 0) for child in plan.get('Plans', []))
    else:
        # For leaf nodes, calculate the input cardinality based on the number of rows in the table mentioned in the node's "Relation Name"
        relation_name = plan.get("Relation Name", None)
        if relation_name:
            cur.execute(f'SELECT COUNT(*) FROM {relation_name}')
            input_cardinality = cur.fetchone()[0]
        else:
            input_cardinality = -1  # Default to 0 if Relation Name is not available
    
    # Extract output cardinality
    output_cardinality = plan.get('Actual Rows', None)

    # Extract base cardinality
    tables = get_table_names(query)
    base_cardinality = 0
    for table in tables:
        cur.execute(f'SELECT COUNT(*) FROM {table}')
        count = cur.fetchone()[0]
        base_cardinality += count

    # Add level feature
    level_feature = f'{level}.{node_num}'

    # Add parent feature
    feature_parent = '-1' if parent is None else parent

    features = {
        'query_index': query_index,
        'query': query,  # Include query for all levels
        'node_type': plan.get('Node Type', ''),
        'parallel_aware': plan.get('Parallel Aware', ''),
        'startup_cost (ms)': plan.get('Startup Cost', ''),
        'total_cost (ms)': plan.get('Total Cost', ''),
        'plan_rows': plan.get('Plan Rows', ''),
        'plan_width': plan.get('Plan Width', ''),
        'actual_startup_time (ms)': plan.get('Actual Startup Time', ''),
        'actual_total_time (ms)': plan.get('Actual Total Time', ''),
        'input_cardinality (rows)': input_cardinality,
        'output_cardinality (rows)': output_cardinality,
        'base_cardinality (rows)': base_cardinality,
        'loop': loop,
        'level_no': level_feature,  # existing feature
        'parent_level': feature_parent  # new feature
    }

    yield features

    if 'Plans' in plan:
        for i, subplan in enumerate(plan['Plans']):
            yield from extract_features(subplan, query_index, query, level=level+1, parent=level_feature, node_num=i+1)

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
    csv_writer = csv.DictWriter(result_csv_file, fieldnames=['query_index', 'query', 'level_no', 'parent_level', 'node_type', 'parallel_aware', 'startup_cost (ms)', 'total_cost (ms)', 'plan_rows', 'plan_width', 'actual_startup_time (ms)', 'actual_total_time (ms)', 'input_cardinality (rows)', 'output_cardinality (rows)', 'base_cardinality (rows)', 'loop'])
    csv_writer.writeheader()

    # Open and execute queries from the queries file
    with open(queries_file, 'r') as queries_file:
        queries = queries_file.read().split(';')

        for query_index, query in enumerate(queries, start=1):
            query = query.strip()
            if query:
                cur = conn.cursor()

                try:
                    print(f"Running query {query_index}: {query[:50]}...")
                    # Execute EXPLAIN ANALYZE to get the query plan
                    cur.execute(f"EXPLAIN (ANALYZE, FORMAT JSON) {query}")
                    result = cur.fetchone()[0]

                    # Check if result is a list and get the first element
                    if isinstance(result, list) and result:
                        result = result[0]

                    # Access the 'Plan' key from the dictionary
                    plan = result.get('Plan', {})

                    # Extract the plan details
                    plan = result['Plan']

                    # Extract the features for all levels
                    for features in extract_features(plan, query_index, query):
                        csv_writer.writerow(features)

                except psycopg2.Error as e:
                    print(f"Error occurred while executing query {query_index}: {str(e)}")
                    # Log the error or take appropriate action
                    conn.rollback()  # Rollback the transaction
                finally:
                    cur.close()

# Close the database connection
conn.close()
