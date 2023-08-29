#!/bin/bash
threshold=20

# Slack webhook URL
webhook_url="webhook url of my slack channel"
    # Get CPU usage percentage
    cpu_usage=$(top -bn 1 | awk '/%Cpu/{print $2}')
    
    # Print CPU usage
    echo "Current CPU Usage: $cpu_usage%"
    # checking the threshold exceeds using if
	 if (( $(echo "$cpu_usage > $threshold" | bc -l) )); then
        message="CPU usage exceeded threshold. Current usage: $cpu_usage%"
        payload="{\"text\": \"$message\"}"

	#Send slack alert 
	curl -X POST -H "Content-Type: application/json" -d "$payload" "$webhook_url"
	 fi


