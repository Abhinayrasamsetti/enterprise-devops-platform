param(
    [string]$CommitRoot = "C:\Users\Abhi\Downloads",
    [int]$Start = 1,
    [int]$End = 999,
    [switch]$Push
)

#----------------------------------------------------------
# Verify repository
#----------------------------------------------------------

$RepoRoot = (& git rev-parse --show-toplevel).Trim()

if ($LASTEXITCODE -ne 0) {
    Write-Host "Not inside a Git repository."
    exit 1
}

Write-Host ""
Write-Host "============================================================"
Write-Host " Enterprise DevOps Platform Commit Automation"
Write-Host "============================================================"
Write-Host "Repository : $RepoRoot"
Write-Host "Commit Root: $CommitRoot"
Write-Host "Range      : $Start -> $End"
Write-Host ""

#----------------------------------------------------------
# Discover Commit Folders
#----------------------------------------------------------

$Folders = Get-ChildItem $CommitRoot -Directory |
Where-Object {

    $_.Name -match '^Commit-(\d+)$' -and
    [int]$Matches[1] -ge $Start -and
    [int]$Matches[1] -le $End

} | Sort-Object {

    [int]($_.Name.Replace("Commit-",""))

}

if($Folders.Count -eq 0){
    Write-Host "No commit folders found."
    exit
}

$Applied = @()
$Skipped = @()
$Failed  = @()

$total = $Folders.Count
$i = 0

foreach($Folder in $Folders){

    $i++

    Write-Progress `
        -Activity "Applying Commits" `
        -Status "$i of $total" `
        -PercentComplete (($i/$total)*100)

    Write-Host ""
    Write-Host "======================================================="
    Write-Host $Folder.Name
    Write-Host "======================================================="

    $Manifest = Join-Path $Folder.FullName "manifest.json"
    $Files    = Join-Path $Folder.FullName "files"

    if(!(Test-Path $Manifest)){
        Write-Host "Manifest missing."
        $Skipped += $Folder.Name
        continue
    }

    if(!(Test-Path $Files)){
        Write-Host "Files folder missing."
        $Skipped += $Folder.Name
        continue
    }

    try{

        $Data = Get-Content $Manifest -Raw | ConvertFrom-Json

        Copy-Item `
            "$Files\*" `
            $RepoRoot `
            -Force `
            -Recurse

    }
    catch{

        Write-Host "Copy failed."
        $Failed += $Folder.Name
        continue

    }

    #
    # Stage
    #

    & git -C $RepoRoot add .

    if($LASTEXITCODE -ne 0){

        Write-Host "git add failed."

        & git -C $RepoRoot reset

        $Failed += $Folder.Name

        continue

    }

    #
    # Any staged changes?
    #

    & git -C $RepoRoot diff --cached --quiet

    if($LASTEXITCODE -eq 0){

        Write-Host "Nothing changed."

        $Skipped += $Folder.Name

        continue

    }

    #
    # Commit
    #

    & git -C $RepoRoot commit -m $Data.message

    if($LASTEXITCODE -ne 0){

        Write-Host "Commit failed."

        & git -C $RepoRoot reset

        $Failed += $Folder.Name

        continue

    }

    Write-Host "SUCCESS"

    $Applied += $Folder.Name

}

Write-Progress -Activity "Applying Commits" -Completed

#
# Push once
#

if($Push){

    Write-Host ""
    Write-Host "Pushing..."

    & git -C $RepoRoot push

    if($LASTEXITCODE -eq 0){

        Write-Host "Push completed."

    }
    else{

        Write-Host "Push failed."

    }

}

#
# Summary
#

Write-Host ""
Write-Host "============================================================"
Write-Host "SUMMARY"
Write-Host "============================================================"

Write-Host ""
Write-Host "Applied ($($Applied.Count))"

foreach($x in $Applied){
    Write-Host "  ✔ $x"
}

Write-Host ""
Write-Host "Skipped ($($Skipped.Count))"

foreach($x in $Skipped){
    Write-Host "  • $x"
}

Write-Host ""
Write-Host "Failed ($($Failed.Count))"

foreach($x in $Failed){
    Write-Host "  ✖ $x"
}

Write-Host ""
Write-Host "Done."