#!/usr/bin/env bash

set -euo pipefail

# Check argument
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <language_code>"
    exit 1
fi

LANG_CODE="$1"

# Find all locale directories
find . -type d -name "locale" | while read -r locale_dir; do
    # Find .pot files inside each locale directory
    find "$locale_dir" -type f -name "*.pot" | while read -r pot_file; do
        # Build .po filename
        po_file="${pot_file%.pot}.${LANG_CODE}.po"

        # Only create if it doesn't already exist
        if [[ -f "$po_file" ]]; then
            echo "Skipping existing: $po_file"
        else
            echo "Creating: $po_file"
            cp "$pot_file" "$po_file"
        fi
    done
done