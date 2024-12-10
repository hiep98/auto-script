#Reanme bulk file in folder

@echo off
setlocal enabledelayedexpansion

:: Set the current directory as the working directory
:: cd /d "%cd%"

:: Prompt user for the directory
echo Enter the full path of the folder:
set /p "folderpath="

:: Check if the directory exists
if not exist "%folderpath%" (
    echo The directory "%folderpath%" does not exist. Exiting...
    pause
    exit /b
)

:: Change to the user-specified directory
cd /d "%folderpath%"

:: Loop through all files in the folder
for %%F in (*.*) do (
    set "filename=%%F"
    set "newname=!filename:~19!"

    if not "!filename!"=="!newname!" (
        echo Renaming "%%F" to "!newname!"
        ren "%%F" "!newname!"
    )
)

endlocal
pause
