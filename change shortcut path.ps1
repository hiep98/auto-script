# Set the old and new paths
$oldPath = "D:\dai\phan mem"
$newPath = "D:\dai\tool"

# Get all .lnk files in the current directory and subdirectories
$shortcutFiles = Get-ChildItem -Recurse -Filter "*.lnk"

# Loop through each shortcut file
foreach ($shortcut in $shortcutFiles) {
    # Create a Shell COM object to manipulate the shortcut
    $shell = New-Object -ComObject WScript.Shell
    $shortcutObject = $shell.CreateShortcut($shortcut.FullName)

    # Check if the shortcut target path contains the old path
    if ($shortcutObject.TargetPath -like "*$oldPath*") {
        # Replace the old path with the new path
        $newTargetPath = $shortcutObject.TargetPath.Replace($oldPath, $newPath)
        
        # Set the new target path and save the shortcut
        $shortcutObject.TargetPath = $newTargetPath
        $shortcutObject.Save()

        Write-Host "Updated shortcut: $($shortcut.FullName)"
    }
    # Clean up the COM object
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($shell) | Out-Null
}
