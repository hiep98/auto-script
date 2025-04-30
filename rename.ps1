
update this ps to set folder target path to rename, and add 1 more phase to remove spaces " " in the heading of every folder, filename inside target path
batch script

# ---------------------------------------------------
# Phase 1: Rename files "[@CB] -" or "[@CB] - "
# ---------------------------------------------------
$files = Get-ChildItem -Recurse -File

foreach ($file in $files) {
    $newName = $file.Name -replace '^\[@CB\]\s*-\s*',''
    if ($file.Name -ne $newName) {
        $oldPath = $file.FullName
        $newPath = Join-Path $file.DirectoryName $newName
        Rename-Item -LiteralPath $oldPath -NewName $newName
        Write-Host "Renamed file: '$oldPath' -> '$newPath'"
    }
}

# ---------------------------------------------------
# Phase 2: Rename folders (deepest first)
# ---------------------------------------------------
$dirs = Get-ChildItem -Recurse -Directory |
        Sort-Object FullName -Descending

foreach ($dir in $dirs) {
    $newName = $dir.Name -replace '^\[@CB\]\s*-\s*',''
    if ($dir.Name -ne $newName) {
        $oldPath = $dir.FullName
        $newPath = Join-Path $dir.Parent.FullName $newName
        Rename-Item -LiteralPath $oldPath -NewName $newName
        Write-Host "Renamed folder: '$oldPath' -> '$newPath'"
    }
}



# Shortest version
# Get-ChildItem -Recurse |
#   Rename-Item -NewName { $_.Name -replace '^\[@CB\]-\s*','' }

# Short version
Get-ChildItem -Recurse -File |
  ForEach-Object {
    $oldName = $_.Name
    $newName = $oldName -replace '^\[@CB\]\s*-\s*',''
    if ($newName -ne $oldName) {
      Rename-Item -LiteralPath $_.FullName -NewName $newName
    }
  }
