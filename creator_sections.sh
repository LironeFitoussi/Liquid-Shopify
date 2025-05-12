# Create Folders Starting with a Section and a Number
# Usage: ./creator_sections.sh <section> <number>

# Prompt the number of folders to create and save as a variable
read -p "Enter the number of folders to create: " num_folders

for ((i=1; i<=num_folders; i++)); do
  # Create a folder with the specified section and number
  mkdir "${1}${i}"
  
  # Create a README.md file inside the folder
  touch "${1}${i}/README.md"
  
  # Create a .gitkeep file inside the folder
  touch "${1}${i}/.gitkeep"

  mkdir "${1}${i}/Lessons"
done