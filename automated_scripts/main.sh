#!/bin/bash

current_dir=$(pwd)
echo $current_dir
sh $current_dir/setup.sh
sh $current_dir/automate_tpch.sh
sh $current_dir/load_data.sh tpch tpch localhost tpch
sh $current_dir/get_info.sh

echo "All scripts executed successfully!"
