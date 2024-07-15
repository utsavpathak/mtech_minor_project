#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo."
    exit
fi

# 1. Check and install Python3 if not installed
echo "Checking Python3..."
if ! command -v python3 &> /dev/null; then
    echo "Python3 not found. Installing..."
    apt update
    apt install -y python3
    echo "Python3 installed successfully."
else
    echo "Python3 is already installed."
fi

# 2. Check and install Git if not installed
echo "Checking Git..."
if ! command -v git &> /dev/null; then
    echo "Git not found. Installing..."
    apt update
    apt install -y git
    echo "Git installed successfully."
else
    echo "Git is already installed."
fi

# 3. Check and install PostgreSQL if not installed
echo "Checking PostgreSQL..."
if ! command -v psql &> /dev/null; then
    echo "PostgreSQL not found. Installing..."
    apt update
    apt install -y postgresql postgresql-contrib
    # Set up PostgreSQL with default user and password
echo "Setting up PostgreSQL users..."
sudo -u postgres psql <<EOF
CREATE USER tpch WITH PASSWORD 'tpch';
ALTER USER tpch WITH SUPERUSER CREATEDB;
EOF
    echo "PostgreSQL installed and set up successfully."
else
    echo "PostgreSQL is already installed."
fi

# 4. Install Python packages using pip
echo "Installing Python packages..."
apt install -y python3-pip
pip3 install --upgrade pip
pip3 install psycopg2 configparser sqlparse statistics
echo "Python packages installed successfully."

# 5. Check and install powertop if not installed
echo "Checking powertop..."
if ! command -v powertop &> /dev/null; then
    echo "powertop not found. Installing..."
    apt update
    apt install -y powertop
    echo "powertop installed successfully."
else
    echo "powertop is already installed."
fi

echo "Setup complete."

