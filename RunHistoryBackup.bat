@echo off
set backup_path=%userprofile%\Desktop\RunHistoryBackup.reg

echo Backing up RunMRU history to %backup_path%...
reg export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" "%backup_path%" /y

if exist "%backup_path%" (
    echo Backup successful! The history is saved to %backup_path%.
) else (
    echo Backup failed.
)

pause
