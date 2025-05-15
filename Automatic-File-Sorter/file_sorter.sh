#!/bin/bash

# Directory to organize (edit this or pass as $1)
TARGET_DIR="${1:-$HOME/Downloads}"

# Define file types
declare -A FILE_TYPES
FILE_TYPES[Documents]="pdf docx txt xlsx pptx"
FILE_TYPES[Images]="jpg jpeg png gif bmp"
FILE_TYPES[Videos]="mp4 mov avi mkv"
FILE_TYPES[Audio]="mp3 wav aac"
FILE_TYPES[Archives]="zip rar tar gz"
FILE_TYPES[Scripts]="sh py js bat"

# Create folders if they don't exist
create_folder() {
    folder="$1"
    [ ! -d "$TARGET_DIR/$folder" ] && mkdir -p "$TARGET_DIR/$folder"
}

# Get category from extension
get_category() {
    ext="$1"
    for category in "${!FILE_TYPES[@]}"; do
        for type in ${FILE_TYPES[$category]}; do
            [[ "$ext" == "$type" ]] && echo "$category" && return
        done
    done
    echo "Others"
}

# Main logic
organize_files() {
    cd "$TARGET_DIR" || exit 1
    for file in *; do
        [ -f "$file" ] || continue
        ext="${file##*.}"
        [[ "$file" == "$ext" ]] && ext=""  # No extension
        category=$(get_category "$ext")
        create_folder "$category"
        mv "$file" "$TARGET_DIR/$category/"
        echo "Moved '$file' → $category/"
    done
}

# Run
organize_files
echo "File sorting completed in $TARGET_DIR"

