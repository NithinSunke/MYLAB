#!/bin/bash

# List of scripts to run
echo "Running script to stop docker containers"
./stop_all_docker_container.sh

if [ $? -ne 0 ]; then
    echo "Error: stop_all_docker_container.sh failed to run."
    exit 1  # Stop execution if a script fails
fi

echo "taking backup of docker directory"
./docker_container_backup.sh

if [ $? -ne 0 ]; then
    echo "Error: docker_container_backup.sh failed to run."
    exit 1  # Stop execution if a script fails
fi

echo "All scripts executed successfully."

