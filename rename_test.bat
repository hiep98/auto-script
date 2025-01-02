@echo off
setlocal enabledelayedexpansion

:: Loop through all files and directories (including subdirectories) that have [@CCSB_0] - in their name
for /r %%I in (*[@CS_1] - *) do (
    :: Extract the item name from the full path (name of the file or folder)
    set "itemName=%%~nxI"

    :: Check if the name contains [@CS_1] - (this is the string we want to remove)
    if "!itemName!" neq "!itemName:[@CS_1] - =!" (
        :: Remove [@CS_1] - from the name
        set "newItemName=!itemName:[@CS_1] - =!"

        :: If the name has changed, rename the file/folder
        echo Renaming "%%I" to "%%~dpI!newItemName!"
        ren "%%I" "!newItemName!"
    )
)

echo All matching files and folders have been renamed.
pause
