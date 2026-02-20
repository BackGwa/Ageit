$source = Join-Path $PSScriptRoot "agents\Ageit.md"
$targetDir = Join-Path $env:USERPROFILE ".config\opencode\agent"
$target = Join-Path $targetDir "Ageit.md"
$commandsSourceDir = Join-Path $PSScriptRoot "commands"
$commandsTargetDir = Join-Path $env:USERPROFILE ".config\opencode\commands"
$requiredCommands = @("commit.md", "commit-push.md", "diff.md")

if (-not (Test-Path $source)) {
    Write-Error "Source not found: $source"
    exit 1
}

if (-not (Test-Path $commandsSourceDir)) {
    Write-Error "Commands directory not found: $commandsSourceDir"
    exit 1
}

foreach ($cmd in $requiredCommands) {
    $cmdPath = Join-Path $commandsSourceDir $cmd
    if (-not (Test-Path $cmdPath)) {
        Write-Error "Required command file not found: $cmdPath"
        exit 1
    }
}

New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
New-Item -ItemType Directory -Path $commandsTargetDir -Force | Out-Null
Copy-Item -Path $source -Destination $target -Force
Copy-Item -Path (Join-Path $commandsSourceDir "*.md") -Destination $commandsTargetDir -Force

Write-Host "Installed: $target"
Write-Host "Installed commands: $commandsTargetDir"
