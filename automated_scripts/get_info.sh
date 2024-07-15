#!/bin/bash

# Define the output file
OUTPUT_FILE="hardware_info.txt"

# Function to get specific type of information
get_info() {
  local type=$1
  echo "Fetching DMI type $type information..."
  sudo dmidecode -t $type >> $OUTPUT_FILE
}

# Clear the output file
> $OUTPUT_FILE

# Fetch the specified information
get_info 0   # BIOS Information
get_info 1   # System Information
get_info 2   # Baseboard Information
get_info 4   # Processor Information
get_info 17  # Memory Device Information

# Fetch disk information using lsblk
echo "Fetching disk information..."
echo "Disk Information:" >> $OUTPUT_FILE
lsblk >> $OUTPUT_FILE

# Confirm the operation
echo "Selected hardware information has been saved to $OUTPUT_FILE"

