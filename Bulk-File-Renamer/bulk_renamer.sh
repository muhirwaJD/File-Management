#!/bin/bash

# Usage: ./bulk_renamer.sh <target_folder> <prefix> <suffix> <extension>

TARGET_DIR="${1:-.}"
PREFIX="${2:-file_}"
SUFFIX="${3:-}"
EXT="${4:-*}"  # Optional: specify extension like jpg, txt, etc.

counter=1

cd "$TARGET_DIR" || { echo "Cannot access directory: $TARGET_DIR"; exit 1; }

for file in *.$EXT; do
    [ -f "$file" ] || continue
    base="${file%.*}"
    ext="${file##*.}"

    new_name="${PREFIX}$(printf "%03d" $counter)${SUFFIX}.${ext}"
    
    mv "$file" "$new_name"
    echo "Renamed '$file' → '$new_name'"
    ((counter++))
done

echo "Bulk renaming complete in '$TARGET_DIR'"
