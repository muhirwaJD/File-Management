#!/bin/bash

# Usage: ./backup_system.sh /path/to/source /path/to/backup_folder compress(true/false)

SOURCE_PATH="${1:-$HOME/Documents}"
BACKUP_DIR="${2:-$HOME/backups}"
COMPRESS="${3:-false}"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$TIMESTAMP"

mkdir -p "$BACKUP_DIR"

if [[ "$COMPRESS" == "true" ]]; then
    TAR_PATH="$BACKUP_DIR/$BACKUP_NAME.tar.gz"
    tar -czf "$TAR_PATH" -C "$(dirname "$SOURCE_PATH")" "$(basename "$SOURCE_PATH")"
    echo "Compressed backup created at: $TAR_PATH"
else
    TARGET_PATH="$BACKUP_DIR/$BACKUP_NAME"
    cp -r "$SOURCE_PATH" "$TARGET_PATH"
    echo "Backup copied to: $TARGET_PATH"
fi

