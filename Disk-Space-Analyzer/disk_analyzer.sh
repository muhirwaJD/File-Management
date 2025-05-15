#!/bin/bash

TARGET_DIR="${1:-.}"       # Default is current directory
MAX_DEPTH="${2:-2}"        # Depth of subdirectory levels to scan
OUTPUT_FILE="${3:-}"       # Optional: output to file if provided

echo "Analyzing: $TARGET_DIR (Depth: $MAX_DEPTH)"
echo ""

# Check if `du` supports --max-depth (macOS/BSD fallback note)
if du --help 2>&1 | grep -q -- '--max-depth'; then
    CMD="du -h --max-depth=$MAX_DEPTH $TARGET_DIR | sort -hr"
else
    CMD="du -h $TARGET_DIR | sort -hr"
fi

if [[ -n "$OUTPUT_FILE" ]]; then
    echo "Output saved to: $OUTPUT_FILE"
    eval "$CMD" > "$OUTPUT_FILE"
else
    eval "$CMD"
fi

echo ""
echo "Disk usage analysis complete."
