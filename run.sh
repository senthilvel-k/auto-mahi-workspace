#!/bin/bash

initial_directory=$(pwd)

show_menu() {
clear
echo "╔════════════════════════════════════════════════════════════╗"
echo "║                    Main Menu                               ║"
echo "╠════════════════════════════════════════════════════════════╣"
echo "║ 1. Download the Workspace                                  ║"
echo "║ ---------------------------------------------------------- ║"
echo "║ 2. Enable VIP Log                                          ║"
echo "║ ---------------------------------------------------------- ║"
echo "║ 3. Compilation Menu                                        ║"
echo "║ ---------------------------------------------------------- ║"
echo "║ 4. Exit                                                    ║"
echo "╚════════════════════════════════════════════════════════════╝"
}

run_first_script() {
  current_path=$(pwd)
  echo "------------------------------"
  echo "Running: Download the Workspace"
  echo "------------------------------"
  ./dependencies/download_workspace.sh
}

run_second_script() {
  current_path=$(pwd)
  echo "------------------------------"
  echo "Running: Enable VIP Log"
  echo "------------------------------"
  ./dependencies/enable_vip_log.sh
}

run_compile_menu() {
  current_path=$(pwd)
  echo "------------------------------"
  echo "Running: Compilation Menu"
  echo "------------------------------"
  ./dependencies/compile.bat
}

while true; do
  show_menu

  read -p "Enter your choice (1, 2, 3, or 4): " choice

  case $choice in
    1) run_first_script ;;
    2) run_second_script ;;
    3) run_compile_menu ;;
    4) exit ;;
    *) echo "Invalid choice. Please enter 1, 2, 3, or 4." ;;
  esac
done
