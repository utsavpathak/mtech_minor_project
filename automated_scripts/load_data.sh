#!/bin/bash

# Check if correct number of arguments are provided
if [ $# -lt 4 ]; then
    echo "Usage: $0 <postgres_user> <postgres_password> <postgres_host> <database_name>"
    exit 1
fi

# Script arguments
POSTGRES_USER=$1
POSTGRES_PASSWORD=$2
POSTGRES_HOST=$3
DATABASE_NAME=$4

# Directory containing .tbl files
TPCH_DIR=tpch-kit/dbgen/output

current_dir=$(pwd)

# Check if directory exists
if [ ! -d "$TPCH_DIR" ]; then
    echo "Directory $TPCH_DIR does not exist."
    exit 1
fi

# Navigate to the directory containing .tbl files
cd "$TPCH_DIR" || { echo "Failed to change directory to $TPCH_DIR"; exit 1; }

# Export the PostgreSQL password
export PGPASSWORD=$POSTGRES_PASSWORD

# Check if the specified database exists
DB_EXISTS=$(psql -h "$POSTGRES_HOST" -U "$POSTGRES_USER" -tAc "SELECT 1 FROM pg_database WHERE datname='$DATABASE_NAME'")

if [ "$DB_EXISTS" != "1" ]; then
    echo "Creating database $DATABASE_NAME in PostgreSQL..."
    psql -h "$POSTGRES_HOST" -U "$POSTGRES_USER" -d postgres -c "CREATE DATABASE $DATABASE_NAME;" || { echo "Failed to create database"; exit 1; }
    psql -h "$POSTGRES_HOST" -U "$POSTGRES_USER" -c "GRANT ALL PRIVILEGES ON DATABASE $DATABASE_NAME TO $POSTGRES_USER;" || { echo "Failed to grant privileges"; exit 1; }
else
    echo "Database $DATABASE_NAME already exists. Loading data into the existing database..."
fi


# Create tables and import data
psql -h "$POSTGRES_HOST" -U "$POSTGRES_USER" -d $DATABASE_NAME <<EOF
-- nation
CREATE TABLE IF NOT EXISTS "nation" (
    "n_nationkey"  INT,
    "n_name"       CHAR(25),
    "n_regionkey"  INT,
    "n_comment"    VARCHAR(152),
    PRIMARY KEY ("n_nationkey"));

-- region
CREATE TABLE IF NOT EXISTS "region" (
    "r_regionkey"  INT,
    "r_name"       CHAR(25),
    "r_comment"    VARCHAR(152),
    PRIMARY KEY ("r_regionkey"));

-- supplier
CREATE TABLE IF NOT EXISTS "supplier" (
    "s_suppkey"     INT,
    "s_name"        CHAR(25),
    "s_address"     VARCHAR(40),
    "s_nationkey"   INT,
    "s_phone"       CHAR(15),
    "s_acctbal"     DECIMAL(15,2),
    "s_comment"     VARCHAR(101),
    PRIMARY KEY ("s_suppkey"));

-- customer
CREATE TABLE IF NOT EXISTS "customer" (
    "c_custkey"     INT,
    "c_name"        VARCHAR(25),
    "c_address"     VARCHAR(40),
    "c_nationkey"   INT,
    "c_phone"       CHAR(15),
    "c_acctbal"     DECIMAL(15,2),
    "c_mktsegment"  CHAR(10),
    "c_comment"     VARCHAR(117),
    PRIMARY KEY ("c_custkey"));

-- part
CREATE TABLE IF NOT EXISTS "part" (
    "p_partkey"     INT,
    "p_name"        VARCHAR(55),
    "p_mfgr"        CHAR(25),
    "p_brand"       CHAR(10),
    "p_type"        VARCHAR(25),
    "p_size"        INT,
    "p_container"   CHAR(10),
    "p_retailprice" DECIMAL(15,2),
    "p_comment"     VARCHAR(23),
    PRIMARY KEY ("p_partkey"));

-- partsupp
CREATE TABLE IF NOT EXISTS "partsupp" (
    "ps_partkey"     INT,
    "ps_suppkey"     INT,
    "ps_availqty"    INT,
    "ps_supplycost"  DECIMAL(15,2),
    "ps_comment"     VARCHAR(199),
    PRIMARY KEY ("ps_partkey", "ps_suppkey"));

-- orders
CREATE TABLE IF NOT EXISTS "orders" (
    "o_orderkey"       INT,
    "o_custkey"        INT,
    "o_orderstatus"    CHAR(1),
    "o_totalprice"     DECIMAL(15,2),
    "o_orderdate"      DATE,
    "o_orderpriority"  CHAR(15),
    "o_clerk"          CHAR(15),
    "o_shippriority"   INT,
    "o_comment"        VARCHAR(79));

-- lineitem
CREATE TABLE IF NOT EXISTS "lineitem"(
    "l_orderkey"          INT,
    "l_partkey"           INT,
    "l_suppkey"           INT,
    "l_linenumber"        INT,
    "l_quantity"          DECIMAL(15,2),
    "l_extendedprice"     DECIMAL(15,2),
    "l_discount"          DECIMAL(15,2),
    "l_tax"               DECIMAL(15,2),
    "l_returnflag"        CHAR(1),
    "l_linestatus"        CHAR(1),
    "l_shipdate"          DATE,
    "l_commitdate"        DATE,
    "l_receiptdate"       DATE,
    "l_shipinstruct"      CHAR(25),
    "l_shipmode"          CHAR(10),
    "l_comment"           VARCHAR(44));

\copy "region"     from '$current_dir/${TPCH_DIR}/region.tbl'       DELIMITER '|' CSV;
\copy "nation"     from '$current_dir/${TPCH_DIR}/nation.tbl'       DELIMITER '|' CSV;
\copy "customer"   from '$current_dir/${TPCH_DIR}/customer.tbl'     DELIMITER '|' CSV;
\copy "supplier"   from '$current_dir/${TPCH_DIR}/supplier.tbl'     DELIMITER '|' CSV;
\copy "part"       from '$current_dir/${TPCH_DIR}/part.tbl'         DELIMITER '|' CSV;
\copy "partsupp"   from '$current_dir/${TPCH_DIR}/partsupp.tbl'     DELIMITER '|' CSV;
\copy "orders"     from '$current_dir/${TPCH_DIR}/orders.tbl'       DELIMITER '|' CSV;
\copy "lineitem"   from '$current_dir/${TPCH_DIR}/lineitem.tbl'     DELIMITER '|' CSV;
EOF

# Unset PGPASSWORD for security
unset PGPASSWORD

echo "Database '$DATABASE_NAME' and data loading process completed successfully."
