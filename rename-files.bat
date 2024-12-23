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
            pushd "%%~dpI" >nul
            ren "%%~nxI" "!newItemName!"
            popd >nul
        ) else (
            ren "%%I" "!newItemName!"
        )
        set "changesMade=true"
    )
)

:: Repeat renaming if changes were made
if "%changesMade%"=="true" goto renameItems

echo All matching names have been processed.
pause
