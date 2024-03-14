import os
import sys
import re
import glob
import csv
import statistics
import configparser
import tempfile
import shutil
import subprocess



def output_to_csv(config, cmd, i, temp_dir, id_mapping):
    # list all csv files corresponding to each query
    csv_files = glob.glob(os.path.join(temp_dir, f"query_{i}*.csv"))
    power_data = []

    # search for power value corresponding to 'psql' in each csv
    for csv_file in csv_files:
        with open(csv_file, 'r') as f:
            pid_power = set()
            for line in f:
                line = line.strip()

                if re.search(r'psql;', line, re.IGNORECASE):
                    pid_pattern = r'PID\s(\d*)'
                    power_pattern = r'(\d*\.?\d*)\s+[m|u]W'
                    pid_match = re.search(pid_pattern, line)
                    power_match = re.search(power_pattern, line)

                    power_val = float(power_match.group(1))
                    power_unit = power_match.group(0)[-2]
                    if power_unit == 'u':
                        power_val *= pow(10, -3)

                    pid = int(pid_match.group(1))

                    pid_power.add((pid, power_val))

            final_power = 0
            for pid, power in pid_power:
                final_power += power

            power_data.append((id_mapping[cmd], cmd, round(final_power, 3)))

    # append the (query, power) in a separate output file
    with open(config['files']['power_csv'], 'a', newline='') as output_file:
        csv_writer = csv.writer(output_file, quoting=csv.QUOTE_MINIMAL)

        # Write data
        for cmd_id, query, power in power_data:
            csv_writer.writerow([cmd_id, query, power])


def calculate_mean(config, id_mapping):
    # Read all the data from the power CSV file
    power_data = []
    with open(config['files']['power_csv'], 'r', newline='') as power_file:
        csv_reader = csv.reader(power_file)
        next(csv_reader)  # Skip header
        for row in csv_reader:
            power_data.append((int(row[0]), row[1], float(row[2])))

    # Calculate mean power for each query
    query_mean = {}
    for cmd_id, query, power in power_data:
        if cmd_id in query_mean:
            query_mean[cmd_id].append((query, power))
        else:
            query_mean[cmd_id] = [(query, power)]

    # Calculate mean of power for each query
    mean_data = [(cmd_id, statistics.mean([power for _, power in powers])) for cmd_id, powers in query_mean.items()]

    # Write mean power to mean CSV file
    with open(config['files']['mean_file'], 'w', newline='') as mean_file:
        csv_writer = csv.writer(mean_file, quoting=csv.QUOTE_MINIMAL)
        # Write header
        csv_writer.writerow(["id", "query", "mean_power"])
        # Write data
        for cmd_id, mean_power in mean_data:
            query = query_mean[cmd_id][0][0]  # Extracting the query corresponding to the ID
            csv_writer.writerow([cmd_id, query, mean_power])


def run_powertop(config):
    # Set PostgreSQL password in the environment variable
    os.environ['PGPASSWORD'] = config['postgres']['password']

    # Create a temporary directory to store temporary CSV files
    temp_dir = tempfile.mkdtemp()

    id_mapping = {}  # To map queries to unique IDs
    next_id = 1

    try:
        with open(config['files']['queries_file'], 'r') as f:
            content = f.read()

            # make a list of commands to execute from the given command file
            commands = content.split(';')
            commands = [cmd.strip() for cmd in commands if cmd.strip()]

            for i, cmd in enumerate(commands):
                # Assign unique ID to the query
                if cmd not in id_mapping:
                    id_mapping[cmd] = next_id
                    next_id += 1

                # psql command to supply as workload to powertop
                psql_cmd = f"psql -h {config['postgres']['host']} -U {config['postgres']['user']} -d {config['postgres']['database']} -c \\\"{cmd}\\\" > /dev/null"
                # final powertop command
                powertop_cmd = f"sudo -E powertop --quiet --workload=\"{psql_cmd}\" --csv={os.path.join(temp_dir, f'query_{i}.csv')} --iteration={config['powertop']['iterations']}"

                # print(f"\n\nRunning PowerTop for query : {cmd}.")
                os.system(powertop_cmd)

                output_to_csv(config, cmd, i, temp_dir, id_mapping)

    finally:
        # Delete the temporary directory and its contents
        shutil.rmtree(temp_dir)

    # Calculate mean of power values
    calculate_mean(config, id_mapping)


def main():
    # Parse configuration from feature_config.ini file
    config = configparser.ConfigParser()
    config.read('feature_config.ini')

    # Clear the output CSV file
    with open(config['files']['power_csv'], 'w', newline='') as output_file:
        csv_writer = csv.writer(output_file, quoting=csv.QUOTE_MINIMAL)
        # Write header
        csv_writer.writerow(["id", "query", "power"])

    run_powertop(config)


if __name__ == "__main__":
    main()
