@echo off
setlocal enabledelayedexpansion

:MAIN
:: Prompt user for folder path
set /p "inputFolder=Enter the folder path: "

:: Check if folder exists
if not exist "!inputFolder!\" (
    echo Error: Folder does not exist.
    pause
    goto MAIN
)

:: Extract folder name from the path
for %%F in ("!inputFolder!") do set "folderName=%%~nxF"

:: Define output file name
set "outputFile=filelist_!folderName!.txt"

:: Check if output file already exists
if exist "!outputFile!" (
    echo The file "!outputFile!" already exists.
    set /p "overwrite=Do you want to overwrite it? (y/n): "
    if /i "!overwrite!" neq "y" (
        echo File was not overwritten.
        goto CONTINUE
    )
)

:: List all items (folders and files, including hidden/system)
dir /b /a "!inputFolder!" > "!outputFile!"

echo File list saved to "!outputFile!"

:CONTINUE
:: Ask user if they want to continue
set /p "continue=Do you want to check another folder? (y/n): "
if /i "!continue!" equ "y" (
    goto MAIN
) else (
    echo Exiting the program.
    pause
    exit /b
)
