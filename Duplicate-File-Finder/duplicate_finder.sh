#!/bin/bash

TARGET_DIR="${1:-.}"
DUP_DIR="$TARGET_DIR/Duplicates"

mkdir -p "$DUP_DIR"
declare -A file_hash_map

echo "🔍 Scanning for duplicates in '$TARGET_DIR'..."

for file in "$TARGET_DIR"/*; do
    [ -f "$file" ] || continue

    hash=$(md5sum "$file" | awk '{print $1}')

    if [[ -n "${file_hash_map[$hash]}" ]]; then
        echo "	Duplicate found:"
        echo "  Original: ${file_hash_map[$hash]}"
        echo "  Duplicate: $file"
        mv "$file" "$DUP_DIR/"
        echo "	Moved to $DUP_DIR"
    else
        file_hash_map[$hash]="$file"
    fi
done

echo "Duplicate scan complete."

