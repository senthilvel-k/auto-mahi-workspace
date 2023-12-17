#!/bin/bash
 current_path=$(pwd)
 echo $current_path
 cd ../
 current_path=$(pwd)
 echo $current_path
 read -p "Enter the new folder name: " FOLDER_NAME

  if [[ -z "$FOLDER_NAME" ]]; then
    echo "Error: Please enter a valid folder name."
    exit 1
  fi

  mkdir "$FOLDER_NAME"
  cd "$FOLDER_NAME"

  echo "Running the first 'repo init'..."
  repo init -u https://bsp-os.git.visteon.com/platform/bsp-os/programs/migration/mahindra/manifest.git -b rel1-SOP1 -m my2024/s220/Release/rel1-SOP1.xml --no-repo-verify && repo sync

  if [[ $? -ne 0 ]]; then
    echo "Error: First 'repo init' failed."
    exit 1
  fi

  echo "Repo initialization and sync completed for $FOLDER_NAME!"
   current_path=$(pwd)
 echo $current_path
  read -p "Press Enter to exit to Main Menu..."