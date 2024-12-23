@echo off
setlocal enabledelayedexpansion

:: Rename files first
for /f "tokens=* delims=" %%F in ('dir /s /b /a-d /o-n') do (
    set "fileName=%%~nxF"
    set "newFileName=!fileName:[@CyberBankSa] -=!"
    if not "!fileName!"=="!newFileName!" (
        echo Renaming file: "%%F" to "%%~dpF!newFileName!"
        ren "%%F" "!newFileName!"
    )
)

:: Rename folders iteratively until no changes are left
:renameFolders
set "changesMade=false"
for /f "tokens=* delims=" %%D in ('dir /s /b /ad /o-n') do (
    set "folderName=%%~nxD"
    set "newFolderName=!folderName:[@CybeS] -=!"
    if not "!folderName!"=="!newFolderName!" (
        echo Renaming folder: "%%D" to "%%~dpD!newFolderName!"
        pushd "%%~dpD" >nul
        ren "%%~nxD" "!newFolderName!"
        popd >nul
        set "changesMade=true"
    )
)

if "%changesMade%"=="true" goto renameFolders

echo All matching names have been processed.
pause
