#!/bin/bash

# Host to ping
host_to_ping="www.google.com"

# Ping the host and report its status
ping -c 4 "$host_to_ping"

if [ $? -eq 0 ]; then
    echo "$host_to_ping is reachable."
else
    echo "$host_to_ping is unreachable."
fi
