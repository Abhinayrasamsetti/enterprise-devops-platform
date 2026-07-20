param(
    [string]$CommitRoot = "C:\Users\Abhi\Downloads",
    [int]$Start = 1,
    [int]$End = 999,
    [switch]$Push
)

# ------------------------------
# Helper
# ------------------------------
function Invoke-Git {
    param(
        [Parameter(ValueFromRemainingArguments = $true)]
        [string[]]$ArgsList
    )

    $output = & git @ArgsList 2>&1
    $exit = $LASTEXITCODE

    return @{
        ExitCode = $exit
        Output   = $output
    }
}

# ------------------------------
# Verify repository
# ------------------------------

$result = Invoke-Git rev-parse --show-toplevel

if($result.ExitCode -ne 0){
    Write-Host ""
    Write-Host "ERROR: Current folder is not inside a Git repository."
    exit 1
}

$RepoRoot = $result.Output.Trim()

Write-Host ""
Write-Host "===================================================="
Write-Host " Enterprise DevOps Platform Commit Automation"
Write-Host "===================================================="
Write-Host "Repository : $RepoRoot"
Write-Host "Commit Root: $CommitRoot"
Write-Host "Range      : $Start -> $End"
Write-Host ""

# ------------------------------
# Discover commit folders
# ------------------------------

$Folders = Get-ChildItem $CommitRoot -Directory |
Where-Object {

    $_.Name -match "^Commit-(\d+)$" -and
    [int]$Matches[1] -ge $Start -and
    [int]$Matches[1] -le $End

} |
Sort-Object {

    [int]($_.Name.Replace("Commit-",""))

}

if($Folders.Count -eq 0){

    Write-Host "No commit folders found."
    exit

}

$total = $Folders.Count

$success = 0
$skipped = 0
$failed = 0

$index = 0

foreach($Folder in $Folders){

    $index++

    Write-Progress `
        -Activity "Applying Commits" `
        -Status "$index of $total" `
        -PercentComplete (($index/$total)*100)

    $Manifest = Join-Path $Folder.FullName "manifest.json"
    $Files = Join-Path $Folder.FullName "files"

    if(!(Test-Path $Manifest)){

        Write-Host ""
        Write-Host "$($Folder.Name) : manifest missing"
        $skipped++
        continue

    }

    if(!(Test-Path $Files)){

        Write-Host ""
        Write-Host "$($Folder.Name) : files folder missing"
        $skipped++
        continue

    }

    $Data = Get-Content $Manifest -Raw | ConvertFrom-Json

    Write-Host ""
    Write-Host "----------------------------------------------------"
    Write-Host "$($Folder.Name)"
    Write-Host $Data.message
    Write-Host "----------------------------------------------------"

    Copy-Item `
        "$Files\*" `
        $RepoRoot `
        -Recurse `
        -Force

    #
    # Stage
    #

    $null = Invoke-Git -C $RepoRoot add .

    if($LASTEXITCODE -ne 0){

        Write-Host "git add failed."

        $failed++

        break

    }

    #
    # Check staged changes
    #

    & git -C $RepoRoot diff --cached --quiet

    if($LASTEXITCODE -eq 0){

        Write-Host "Nothing changed."

        $skipped++

        continue

    }

    #
    # Commit
    #

    $null = Invoke-Git -C $RepoRoot commit -m $Data.message

    if($LASTEXITCODE -ne 0){

        Write-Host "git commit failed."

        $failed++

        break

    }

    Write-Host "SUCCESS"

    $success++

}

Write-Progress -Activity "Applying Commits" -Completed

#
# Push
#

if($Push){

    Write-Host ""
    Write-Host "Pushing..."

    $null = Invoke-Git -C $RepoRoot push

    if($LASTEXITCODE -eq 0){

        Write-Host "Push successful."

    }
    else{

        Write-Host "Push failed."

    }

}

Write-Host ""
Write-Host "===================================================="
Write-Host "SUMMARY"
Write-Host "===================================================="
Write-Host "Applied : $success"
Write-Host "Skipped : $skipped"
Write-Host "Failed  : $failed"
Write-Host "===================================================="