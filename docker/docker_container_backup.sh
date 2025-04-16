#!/bin/bash

# Prompt user for directory to back up and the backup destination
SOURCE_DIR='/u01/docker'
BACKUP_DIR='/u01/BACKUP'

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

# Create backup destination directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Get the current timestamp for the backup file name
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

# Define the backup file name
BACKUP_FILE="$BACKUP_DIR/backup_$(basename "$SOURCE_DIR")_$TIMESTAMP.tar.gz"

# Take the tar backup of the directory
echo "Backing up directory '$SOURCE_DIR' to '$BACKUP_FILE'..."

sudo tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

echo "Backup completed successfully. Backup file: $BACKUP_FILE"

