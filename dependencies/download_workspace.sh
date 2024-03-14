#!/bin/bash

# Safeguard to ensure the script is run from the correct parent directory.
if [[ "$(basename "$(pwd)")" != "your_expected_parent_directory_name" ]]; then
    echo "Error: This script must be run from a subdirectory of the intended parent directory."
    exit 1
fi

# Prompt the user for the new folder name and validate it.
read -p "Enter the new folder name: " FOLDER_NAME
if [[ -z "$FOLDER_NAME" ]]; then
    echo "Error: Please enter a valid folder name."
    exit 1
fi

# Create the new directory and change into it, with error handling.
mkdir "$FOLDER_NAME" && cd "$FOLDER_NAME" || { echo "Error: Failed to create or change into the new directory."; exit 1; }

# Run the first 'repo init' and sync, with error handling.
echo "Running the first 'repo init'..."
if ! repo init -u https://bsp-os.git.visteon.com/platform/bsp-os/programs/migration/mahindra/manifest.git -b develop -m my2024/s220/VP_Domain.xml --no-repo-verify && repo sync; then
    echo "Error: First 'repo init' failed. Please Retry "
    exit 1
fi

# Print the current path for confirmation.
current_path=$(pwd)
echo "Repo initialization and sync completed for $FOLDER_NAME! Current path: $current_path"

# Wait for the user to press Enter before exiting.
read -p "Press Enter to exit to Main Menu..."
