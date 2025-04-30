# PowerShell script to rename items in a specified target path

# ----------------------------
# Configuration
# ----------------------------
# Set the root folder where renaming should occur:
$targetPath = "F:\OTHER vendor\Pentester Academy\altered security new\test\"

# ----------------------------
# Phase 1: Rename files "[@CB] -" or "[@CB] - "
# ----------------------------
$files = Get-ChildItem -Path $targetPath -Recurse -File
foreach ($file in $files) {
    $newName = $file.Name -replace '^\[@CB\]\s*-\s*',''
    if ($file.Name -ne $newName) {
        Rename-Item -LiteralPath $file.FullName -NewName $newName
        Write-Host "Renamed file: '$($file.FullName)' -> '$newName'"
    }
}

# ----------------------------
# Phase 2: Rename folders (deepest first) for "[@CB] -"
# ----------------------------
$dirs = Get-ChildItem -Path $targetPath -Recurse -Directory |
        Sort-Object FullName -Descending
foreach ($dir in $dirs) {
    $newName = $dir.Name -replace '^\[@CB\]\s*-\s*',''
    if ($dir.Name -ne $newName) {
        Rename-Item -LiteralPath $dir.FullName -NewName $newName
        Write-Host "Renamed folder: '$($dir.FullName)' -> '$newName'"
    }
}

# ----------------------------
# Phase 3: Remove leading spaces in names of folders and files
# ----------------------------
# 3a. Folders (deepest first)
$dirs2 = Get-ChildItem -Path $targetPath -Recurse -Directory |
         Sort-Object FullName -Descending
foreach ($dir in $dirs2) {
    $newName = $dir.Name -replace '^\s+',''
    if ($dir.Name -ne $newName) {
        Rename-Item -LiteralPath $dir.FullName -NewName $newName
        Write-Host "Trimmed spaces: '$($dir.FullName)' -> '$newName'"
    }
}

# 3b. Files
$files2 = Get-ChildItem -Path $targetPath -Recurse -File
foreach ($file in $files2) {
    $newName = $file.Name -replace '^\s+',''
    if ($file.Name -ne $newName) {
        Rename-Item -LiteralPath $file.FullName -NewName $newName
        Write-Host "Trimmed spaces: '$($file.FullName)' -> '$newName'"
    }
}

# ----------------------------
# End of script
# ----------------------------


# # Shortest version
# # Get-ChildItem -Recurse |
# #   Rename-Item -NewName { $_.Name -replace '^\[@CB\]-\s*','' }

# # Short version
# Get-ChildItem -Recurse -File |
#   ForEach-Object {
#     $oldName = $_.Name
#     $newName = $oldName -replace '^\[@CB\]\s*-\s*',''
#     if ($newName -ne $oldName) {
#       Rename-Item -LiteralPath $_.FullName -NewName $newName
#     }
#   }
