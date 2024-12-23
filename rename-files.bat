@echo off
setlocal enabledelayedexpansion

:: Function to rename items (files and folders)
:renameItems

:: Loop through all files (including subdirectories) that have [@CybeS] in the name
for /r %%I in (*[@CybeS]*) do (
    :: Extract the filename (name and extension) from the full path
    set "itemName=%%~nxI"
    
    :: Replace [@CybeS] with -= in the filename
    set "newItemName=!itemName:[@CybeS] -=!"
    
    :: If the filename is different after renaming, perform the renaming
    if not "!itemName!"=="!newItemName!" (
        :: Check if the file's directory exists (to prevent errors)
        if not "%%~dpI"=="" (
            echo Renaming "%%I" to "%%~dpI!newItemName!"
            ren "%%I" "!newItemName!"
        )
    )
)

:: Loop through all directories (including subdirectories) that have [@CybeS] in the name
for /d /r %%I in (*[@CybeS]*) do (
    :: Extract the folder name from the full directory path
    set "itemName=%%~nxI"
    
    :: Replace [@CybeS] with -= in the folder name
    set "newItemName=!itemName:[@CybeS] -=!"
    
    :: If the folder name is different after renaming, perform the renaming
    if not "!itemName!"=="!newItemName!" (
        :: Use pushd to change the directory before renaming the folder
        pushd "%%~dpI" >nul
        echo Renaming folder "%%I" to "%%~dpI!newItemName!"
        ren "%%~nxI" "!newItemName!"
        popd >nul 
    )
)

echo All matching names have been processed.
pause
