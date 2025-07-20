#!/usr/bin/env bash

# Loop through all .md files in content/posts or wherever you store them
for file in content/posts/*.md; do
  filename=$(basename "$file" .md)

  # Replace title: ... with title: filename
  sed -i "s/^title: .*/title: $filename/" "$file"

  # Remove first line if it's "# filename"
  first_heading="# $filename"
  first_line=$(head -n 1 "$file")

  # Skip YAML front matter
  if [[ "$first_line" == "---" ]]; then
    heading_line=$(awk '/^---$/ {found++} found==2 {print; exit}' "$file" | head -n1)
    if [[ "$heading_line" == "$first_heading" ]]; then
      # Remove the heading line (after front matter)
      awk -v skip="$first_heading" '
        BEGIN {found=0}
        {
          if ($0 == "---") found++
          if (found == 2 && $0 == skip && !printed) {printed=1; next}
          print
        }
      ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
    fi
  fi
done
