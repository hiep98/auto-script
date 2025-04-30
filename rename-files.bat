@echo off
setlocal enabledelayedexpansion

:: Define the two prefixes to remove
set "prefix1=[@CB] - "
set "prefix2=[@CB] -"

:: === 1. Rename all matching files (recursive) ===
for /r %%I in ("%prefix1%*") do call :renameFile "%%I" "%prefix1%"
for /r %%I in ("%prefix2%*") do call :renameFile "%%I" "%prefix2%"

:: === 2. Rename all matching directories (bottom-up) ===
for /f "delims=" %%D in ('dir /b /s /ad "%prefix1%*" ^| sort /r') do call :renameDir "%%D" "%prefix1%"
for /f "delims=" %%D in ('dir /b /s /ad "%prefix2%*" ^| sort /r') do call :renameDir "%%D" "%prefix2%"

echo All matching items have been renamed.
pause
goto :eof

:renameFile
rem %1 = full path to the file, %2 = prefix to strip
set "fullpath=%~1"
set "nameonly=%~nx1"
set "parent=%~dp1"
set "newname=!nameonly:%~2=!"
if /i not "!nameonly!"=="!newname!" (
    echo Renaming file "%fullpath%" to "%parent%%newname%"
    ren "%fullpath%" "%newname%"
)
goto :eof

:renameDir
rem %1 = full path to the directory, %2 = prefix to strip
set "fullpath=%~1"
set "dname=%~nx1"
set "dparent=%~dp1"
set "newdname=!dname:%~2=!"
if /i not "!dname!"=="!newdname!" (
    echo Renaming folder "%fullpath%" to "%dparent%%newdname%"
    pushd "%dparent%" >nul
    ren "%dname%" "%newdname%"
    popd >nul
)
goto :eof
