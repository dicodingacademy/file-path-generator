#!/bin/bash

TARGET_DIR="${1:-.}"
OUTPUT_FILE="files.json"

SKIP_DIRS=(
  # Node & JS ecosystem
  "node_modules" ".npm" ".yarn" ".pnpm-store"
  # Build & dist
  "build" "dist" ".build" ".dist" "out" ".output"
  # Framework folders
  ".next" ".nuxt" ".svelte-kit" ".astro" ".vite" ".angular"
  # Cache/temp
  "cache" ".cache" ".vite-cache" ".parcel-cache" ".turbo" ".gradle" ".sass-cache"
  # Language/Backend specific
  "vendor" "target" "bin" "obj" ".cargo"
  # Docs build
  ".docusaurus" "docs/.vuepress/dist"
  # CI/CD / Infra
  ".github" ".gitlab" ".terraform", ".git"
)

echo "[" > "$OUTPUT_FILE"

PRUNE_EXPR=""
for d in "${SKIP_DIRS[@]}"; do
  PRUNE_EXPR="$PRUNE_EXPR -path \"$TARGET_DIR/$d\" -prune -o"
done

eval "find \"$TARGET_DIR\" $PRUNE_EXPR -type f -print" | while read -r file; do
  clean="${file#./}"
  esc=$(printf '%s' "$clean" | sed 's/\"/\\\"/g')
  echo "  \"${esc}\"," >> "$OUTPUT_FILE"
done

sed -i '$ s/,$//' "$OUTPUT_FILE"
echo "]" >> "$OUTPUT_FILE"

echo "File tersimpan di $OUTPUT_FILE"
