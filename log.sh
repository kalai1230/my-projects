#!/bin/bash

# Define the directory path where the files are located
target_directory="/root/backup"

# Define the maximum age of files to keep (in days)
cutoff_date=$(date -d "yesterday" +%s)

# Find and delete files which present greater than the max_age value
find "$target_directory" -type f -newermt "$(date -d @$cutoff_date +"%Y-%m-%d %H:%M:%S")" -exec rm {} \;

echo "Cleanup completed."

