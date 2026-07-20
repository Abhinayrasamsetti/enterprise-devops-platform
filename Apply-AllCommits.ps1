param(
    [string]$CommitRoot = "C:\Users\Abhi\Downloads",
    [int]$Start = 1,
    [int]$End = 999,
    [switch]$Push
)

$ErrorActionPreference = "Stop"

# Verify we're inside a Git repository
try {
    $RepoRoot = (git rev-parse --show-toplevel).Trim()
}
catch {
    Write-Host "ERROR: Run this script from inside your Git repository."
    exit 1
}

Write-Host ""
Write-Host "==============================================="
Write-Host " Enterprise DevOps Platform Commit Applier"
Write-Host "==============================================="
Write-Host "Repository : $RepoRoot"
Write-Host "Commit Root: $CommitRoot"
Write-Host "Commit Range: $Start -> $End"
Write-Host ""

# Discover Commit-XXX folders within the range
$CommitFolders = Get-ChildItem $CommitRoot -Directory |
    Where-Object {
        $_.Name -match '^Commit-(\d+)$' -and
        [int]($Matches[1]) -ge $Start -and
        [int]($Matches[1]) -le $End
    } |
    Sort-Object { [int]($_.Name -replace 'Commit-','') }

if($CommitFolders.Count -eq 0)
{
    Write-Host "No matching commit folders found."
    exit
}

foreach($Folder in $CommitFolders)
{
    $Manifest = Join-Path $Folder.FullName "manifest.json"
    $Files = Join-Path $Folder.FullName "files"

    if(!(Test-Path $Manifest))
    {
        Write-Host "Skipping $($Folder.Name) (manifest.json missing)"
        continue
    }

    if(!(Test-Path $Files))
    {
        Write-Host "Skipping $($Folder.Name) (files folder missing)"
        continue
    }

    $Data = Get-Content $Manifest -Raw | ConvertFrom-Json

    Write-Host ""
    Write-Host "======================================="
    Write-Host "Applying $($Folder.Name)"
    Write-Host "$($Data.message)"
    Write-Host "======================================="

    Copy-Item "$Files\*" $RepoRoot -Recurse -Force

    # Stage files (ignore CRLF warnings)
    git -C $RepoRoot add . *> $null

    if($LASTEXITCODE -ne 0)
    {
        throw "git add failed."
    }

    # Skip if nothing changed
    git -C $RepoRoot diff --cached --quiet

    if($LASTEXITCODE -eq 0)
    {
        Write-Host "No changes detected."
        continue
    }

    git -C $RepoRoot commit -m "$($Data.message)"

    if($LASTEXITCODE -ne 0)
    {
        throw "git commit failed."
    }

    Write-Host "✓ Commit created."
}

if($Push)
{
    Write-Host ""
    Write-Host "Pushing to GitHub..."

    git -C $RepoRoot push

    if($LASTEXITCODE -ne 0)
    {
        throw "Push failed."
    }

    Write-Host "✓ Push successful."
}

Write-Host ""
Write-Host "==============================================="
Write-Host "Completed Successfully"
Write-Host "==============================================="