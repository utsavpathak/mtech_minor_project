#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Clone the TPC-H repository
echo "Cloning TPC-H repository..."
git clone "https://github.com/gregrahn/tpch-kit.git"

# Navigate to the dbgen directory
cd tpch-kit/dbgen

# Compile the dbgen and qgen tools
echo "Compiling dbgen and qgen..."
make

# Ensure dists.dss file exists
if [ ! -f dists.dss ]; then
    echo "Error: dists.dss file not found in dbgen directory"
    exit 1
fi

# Create output directory
echo "Creating output directory..."
mkdir -p output

# Set environment variables and permissions, generate TPC-H data files
echo "Generating TPC-H data files..."
export DSS_CONFIG=$(pwd)
export DSS_QUERY=$DSS_CONFIG/queries
export DSS_PATH=$DSS_CONFIG/output
chmod u+x qgen
chmod u+w $DSS_PATH
./dbgen -s 1

# Verify output
echo "Verifying output files..."
ls $DSS_PATH

echo "TPC-H data generation completed successfully."
