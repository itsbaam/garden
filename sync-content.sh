#!/usr/bin/env bash
# Syncs Obsidian notes with `stage: public` to Quartz content/
set -euo pipefail

VAULT="/home/itsbaam/Personal/ObsidianVaults/NEW_REALITY"
CONTENT="/home/itsbaam/Personal/dev/garden/content"

# Clean previous sync
rm -rf "$CONTENT"/*

count=0

# Find all markdown files with stage: public in frontmatter
while IFS= read -r -d '' file; do
  # Check if file has stage: public in frontmatter
  if head -50 "$file" | sed -n '/^---$/,/^---$/p' | grep -q 'stage:.*public'; then
    # Get path relative to vault
    rel="${file#$VAULT/}"
    dest="$CONTENT/$rel"

    mkdir -p "$(dirname "$dest")"
    cp "$file" "$dest"
    ((count++))
  fi
done < <(find "$VAULT" -name '*.md' -not -path '*/.obsidian/*' -not -path '*/templates/*' -print0)

# Also copy linked images/attachments referenced by public notes
if [ -d "$VAULT/assets" ]; then
  mkdir -p "$CONTENT/assets"
  cp -r "$VAULT/assets/"* "$CONTENT/assets/" 2>/dev/null || true
fi

echo "Synced $count public notes to Quartz content/"
