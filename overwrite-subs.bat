@echo off

REM Define source and destination directories
set "source=D:\d\DData"
set "destination=D:\d\newd"

REM Create destination directory if it doesn't exist
if not exist "%destination%" (
    mkdir "%destination%"
)

REM Use robocopy to copy .srt files recursively and overwrite existing files
robocopy "%source%" "%destination%" *.srt /S /R:0 /W:0 /NFL /NDL /NJH /NJS

REM Provide feedback to the user
echo Copy operation completed.
pause
