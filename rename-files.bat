:: Rename bulk file in folder
@echo off
setlocal enabledelayedexpansion


:: Prompt user for the directory
:: echo Enter the full path of the folder:
:: set /p "folderpath="


:: Set folderpath to the current directory
set "folderpath=%cd%"

:: Verify the folderpath
echo Folder path: %folderpath%

:: Check if the directory exists
if not exist "%folderpath%" (
    echo The directory "%folderpath%" does not exist. Exiting...
    pause
    exit /b
)

:: Change to the folderpath (we're already in it, but ensure we're set)
cd /d "%folderpath%" || (
    echo Unable to change to directory "%folderpath%". Exiting...
    pause
    exit /b
)

:: Loop through all files in the folder
for %%F in (*.*) do (
    set "filename=%%F"
	:: remove 19 last characters
	set "newname=!filename:~19!"
	:: remove _Replace text in file name
    set "newname=!filename:_Replace=!"

    if not "!filename!"=="!newname!" (
        echo Renaming "%%F" to "!newname!"
        ren "%%F" "!newname!"
    )
)

endlocal
pause
