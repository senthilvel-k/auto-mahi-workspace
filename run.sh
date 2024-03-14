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

run_script() {
    echo "------------------------------"
    echo "Running: $1"
    echo "------------------------------"
    ./dependencies/$1.sh
}

run_compile_menu() {
    echo "------------------------------"
    echo "Running: Compilation Menu"
    echo "------------------------------"
    ./dependencies/compile.bat
}

while true; do
    show_menu

    read -p "Enter your choice (1, 2, 3, or 4): " choice

    case $choice in
        1) run_script "download_workspace" ;;
        2) run_script "enable_vip_log" ;;
        3) run_compile_menu ;;
        4) exit ;;
        *) echo "Invalid choice. Please enter 1, 2, 3, or 4." ;;
    esac
done
