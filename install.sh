#!/usr/bin/env bash
set -euo pipefail

RAW_BASE="${AGEIT_RAW_BASE:-https://raw.githubusercontent.com/BackGwa/Ageit/main}"
AGENT_DIR="${HOME}/.config/opencode/agent"
COMMANDS_DIR="${HOME}/.config/opencode/commands"
mkdir -p "$AGENT_DIR" "$COMMANDS_DIR"

curl -fsSL "${RAW_BASE}/agents/Ageit.md" -o "${AGENT_DIR}/Ageit.md"
for cmd in commit.md commit-push.md diff.md; do
  curl -fsSL "${RAW_BASE}/commands/${cmd}" -o "${COMMANDS_DIR}/${cmd}"
done

echo "Installed: ${AGENT_DIR}/Ageit.md"
echo "Installed commands: ${COMMANDS_DIR}"
