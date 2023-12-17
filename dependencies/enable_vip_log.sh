#!/bin/bash
 cd ../
initial_directory=$(pwd)
echo Current Directory: $initial_directory
while true; do
  echo "---------------------------"
  read -p "Enter the folder name: " FOLDER_NAME
  echo "---------------------------"

  # Check if the folder exists
  if [ ! -d "$FOLDER_NAME" ]; then
      echo "Error: Folder '$FOLDER_NAME' does not exist. Please enter a valid folder name."
      continue
  fi

  path=$(pwd)
  target_directory="$path/$FOLDER_NAME/MAHINDRA_S220_MY24_VP/dc.app.scl.infra.common"

  # Check if the target directory exists
  if [ ! -d "$target_directory" ]; then
      echo "Error: Target directory '$target_directory' does not exist. Please re-enter the folder name."
      continue
  fi

  # Change to the target directory
  cd "$target_directory" || exit 1

  # Apply the patch
  git apply "$path/auto-mahi-workspace/dependencies/vip_debug.patch"

# Check the exit status of the git apply command
  if [ $? -eq 0 ]; then
    echo "------------------------------"
    echo "VIP Debug Enabling Successful"
    echo "------------------------------"
  else
    echo "------------------------------"
    echo "VIP Debug Enabling Unsuccessful"
    echo "------------------------------"
  fi

  # Pause for user input
  read -p "Press Enter to exit to Main Menu..."

  # Return to the initial directory
  cd "$initial_directory" || exit 1

  break  # Exit the loop if the correct folder is found
done
