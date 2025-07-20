#!/bin/bash
set -e

CONTENT_DIR="./content/posts"  

for file in "$CONTENT_DIR"/*.md; do
  [ -f "$file" ] || continue

  # Extract and slugify the title
  title=$(awk '/^title:/ { sub(/^title:[[:space:]]*/, ""); print; exit }' "$file")
  slug=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/-\+/-/g' | sed 's/^-//;s/-$//')
  newfile="$CONTENT_DIR/$slug.md"

  # Process file:
  awk -v title="$title" -v slug="$slug" '
    BEGIN { inFM = 0; removed = 0 }
    /^---/ {
      inFM++
      print
      next
    }
    inFM == 1 && /^slug:/ {
      print "slug: " slug
      next
    }
    inFM == 2 && tolower($0) == "# " tolower(title) && removed == 0 {
      removed = 1
      next
    }
    { print }
  ' "$file" > "$file.tmp"

  mv "$file.tmp" "$newfile"
  if [[ "$file" != "$newfile" ]]; then rm "$file"; fi
done
