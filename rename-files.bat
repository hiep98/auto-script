@echo off
setlocal enabledelayedexpansion

:: Start the renaming process
:renameItems
set "changesMade=false"

:: Loop through all files and folders in the current directory and subdirectories
for /f "delims=" %%I in ('dir /s /b /o-n') do (
    :: Extract the file/folder name and create the new name by replacing "[@CybeS] -"
    set "newName=%%~nxI"
    set "newName=!newName:[@CybeS] -=!"

    :: If the new name is different from the original, rename the item
    if not "%%~nxI"=="!newName!" (
        :: Display the rename operation (for user feedback)
        echo Renaming: %%I to %%~dpI!newName!
        
        :: Rename the file or folder
        ren "%%I" "!newName!"

        :: Mark that changes have been made
        set "changesMade=true"
    )
)

:: If any renaming was done, repeat the process to ensure all items are renamed
if "%changesMade%"=="true" goto renameItems

:: Final message once all renaming is complete
echo All matching names have been processed.

:: Wait for user to press any key before closing
pause
