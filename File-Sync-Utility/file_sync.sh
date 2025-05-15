#!/bin/bash

DIR1="$1"
DIR2="$2"
LOGFILE="sync_log_$(date +%F_%H-%M-%S).txt"

if [[ -z "$DIR1" || -z "$DIR2" ]]; then
    echo "Usage: ./file_sync.sh /path/to/source /path/to/target"
    exit 1
fi

echo "	Starting two-way sync between:"
echo " - $DIR1"
echo " - $DIR2"
echo "	Logging to: $LOGFILE"
echo ""

# One-way sync DIR1 -> DIR2
rsync -av --update --delete "$DIR1/" "$DIR2/" >> "$LOGFILE"

# One-way sync DIR2 -> DIR1
rsync -av --update --delete "$DIR2/" "$DIR1/" >> "$LOGFILE"

echo "Sync complete. Check log: $LOGFILE"

