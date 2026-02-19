#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE="$SCRIPT_DIR/agents/Ageit.md"
TARGET_DIR="$HOME/.config/opencode/agent"
TARGET="$TARGET_DIR/Ageit.md"

if [[ ! -f "$SOURCE" ]]; then
  echo "Source file not found: $SOURCE" >&2
  exit 1
fi

mkdir -p "$TARGET_DIR"

cp -f "$SOURCE" "$TARGET"
echo "Installed: $TARGET"
