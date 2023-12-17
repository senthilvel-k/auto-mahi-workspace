@echo off

:main_menu
set /p variable_part=Enter the variable part of the path (e.g., TEMPERATURE): 

:: Additional prompt for platform choice
set /p platform_choice=Is it for S220 or S237? Enter 'S220' or 'S237': 

:: Construct the full path relative to the script location (going two levels up)
set "target_directory=%~dp0..\..\%variable_part%\MAHINDRA_S220_MY24_VP\dc.app.scl.vip.sys\build"

:menu
:: Display menu options
echo You're working on %platform_choice%!
echo Build Menu:
echo 1. Clean
echo 2. Incremental Build
echo 3. Clean Build
echo 4. Exit to Main Menu

:: Prompt the user for menu choice
set /p menu_choice=Enter your choice (1, 2, 3, or 4): 

:: Execute the selected command based on user's choice
if "%menu_choice%"=="1" (
    pushd "%target_directory%" 
    echo "%target_directory%"
    call cleanall
    popd
    goto menu
) 
if "%menu_choice%"=="2" (
    pushd "%target_directory%" 
    echo "%target_directory%"
    if /i "%platform_choice%"=="S237" (
        echo make W601High -j8
        call make W601High -j8
    ) else (
        echo make W601HighVar2 -j8
        call make W601HighVar2 -j8
    )
    popd
    goto menu
)
if "%menu_choice%"=="3" (
    pushd "%target_directory%" 
    echo "%target_directory%"
    call cleanall
    if /i "%platform_choice%"=="S237" (
        echo make W601High -j8
        call make W601High -j8
    ) else (
        echo make W601HighVar2 -j8
        call make W601HighVar2 -j8
    )
    popd
    goto menu
)
if "%menu_choice%"=="4" (
    exit /b
)

goto :eof
