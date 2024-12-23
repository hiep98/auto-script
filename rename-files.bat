@echo off
setlocal enabledelayedexpansion

:: Rename files and folders in one loop
:renameItems
set "changesMade=false"
for /f "tokens=* delims=" %%I in ('dir /s /b /o-n') do (
    set "itemName=%%~nxI"
    set "newItemName=!itemName:[@CybeS] -=!"

    if not "!itemName!"=="!newItemName!" (
        if exist "%%I\" (
            set "newFolderName=!newItemName!"
            echo Renaming folder: "%%I" to "%%~dpI!newFolderName!"
            pushd "%%~dpI" >nul
            ren "%%~nxI" "!newFolderName!"
            popd >nul
        ) else (
            set "newFileName=!newItemName!"
            echo Renaming file: "%%I" to "%%~dpI!newFileName!"
            ren "%%I" "!newFileName!"
        )
        set "changesMade=true"
    )
)

:: Repeat renaming if changes were made
if "%changesMade%"=="true" goto renameItems

echo All matching names have been processed.
pause
