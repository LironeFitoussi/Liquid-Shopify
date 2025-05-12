#!/bin/bash
# Create LessonX.md files inside a selected Lessons folder

# List all Lessons directories
echo "Available Lessons folders:"
mapfile -t lessons_dirs < <(find . -type d -name Lessons)

select lessons_dir in "${lessons_dirs[@]}"; do
  if [ -n "$lessons_dir" ]; then
    break
  else
    echo "Invalid selection. Try again."
  fi
done

# Ask for range
read -p "Enter starting lesson number: " start
read -p "Enter ending lesson number: " end

# Validate
if ! [[ "$start" =~ ^[0-9]+$ && "$end" =~ ^[0-9]+$ && "$start" -le "$end" ]]; then
  echo "Invalid range. Please enter numbers and ensure start <= end."
  exit 1
fi

# Create LessonX.md files
for ((i=start; i<=end; i++)); do
  file_path="${lessons_dir}/Lesson${i}.md"
  touch "$file_path"
  echo "Created $file_path"
done

echo "All markdown files created successfully."
