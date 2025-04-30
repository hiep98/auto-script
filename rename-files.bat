@echo off
setlocal enabledelayedexpansion

:: 1. Rename all files starting with [@CB] - 
for /r %%I in ("[@CB] - *") do (
    set "itemName=%%~nxI"
    set "newItemName=!itemName:[@CB] - =!"
    if /i not "!itemName!"=="!newItemName!" (
        echo Renaming file "%%I" to "%%~dpI!newItemName!"
        ren "%%I" "!newItemName!"
    )
)

:: 2. Rename directories bottom-up
for /f "delims=" %%D in ('dir /b /s /ad "[@CB] - *" ^| sort /r') do (
    set "itemName=%%~nxD"
    set "newItemName=!itemName:[@CB] - =!"
    if /i not "!itemName!"=="!newItemName!" (
        echo Renaming folder "%%D" to "%%~dpD!newItemName!"
        pushd "%%~dpD" >nul
        ren "%%~nxD" "!newItemName!"
        popd >nul
    )
)

echo All matching items have been renamed.
pause
