#!/bin/bash

TARGET_DIR="${1:-.}"
OUTPUT_FILE="files.json"

echo "[" > "$OUTPUT_FILE"
find "$TARGET_DIR" -type f | while read -r file; do
    clean="${file#./}"
    esc=$(printf '%s' "$clean" | sed 's/"/\\"/g')

    echo "  \"${esc}\"," >> "$OUTPUT_FILE"
done

sed -i '$ s/,$//' "$OUTPUT_FILE"
echo "]" >> "$OUTPUT_FILE"

echo "File tersimpan di $OUTPUT_FILE"
