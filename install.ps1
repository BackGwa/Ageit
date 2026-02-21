$rawBase = if ($env:AGEIT_RAW_BASE) { $env:AGEIT_RAW_BASE } else { "https://raw.githubusercontent.com/BackGwa/Ageit/main" }
$agentDir = Join-Path $env:USERPROFILE ".config\opencode\agent"
$commandsDir = Join-Path $env:USERPROFILE ".config\opencode\commands"
New-Item -ItemType Directory -Path $agentDir -Force | Out-Null
New-Item -ItemType Directory -Path $commandsDir -Force | Out-Null

Invoke-WebRequest "$rawBase/agents/Ageit.md" -OutFile (Join-Path $agentDir "Ageit.md")
"commit.md", "commit-push.md", "diff.md" | ForEach-Object {
    Invoke-WebRequest "$rawBase/commands/$_" -OutFile (Join-Path $commandsDir $_)
}

Write-Host "Installed: $(Join-Path $agentDir 'Ageit.md')"
Write-Host "Installed commands: $commandsDir"
