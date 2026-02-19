$source = Join-Path $PSScriptRoot "agents\Ageit.md"
$targetDir = Join-Path $env:USERPROFILE ".config\opencode\agent"
$target = Join-Path $targetDir "Ageit.md"

if (-not (Test-Path $source)) {
    Write-Error "Source not found: $source"
    exit 1
}

New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
Copy-Item -Path $source -Destination $target -Force

Write-Host "Installed: $target"
