#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE="$SCRIPT_DIR/agents/Ageit.md"
TARGET_DIR="$HOME/.config/opencode/agent"
TARGET="$TARGET_DIR/Ageit.md"
COMMANDS_SOURCE_DIR="$SCRIPT_DIR/commands"
COMMANDS_TARGET_DIR="$HOME/.config/opencode/commands"
REQUIRED_COMMANDS=("commit.md" "commit-push.md" "diff.md")

if [[ ! -f "$SOURCE" ]]; then
  echo "Source file not found: $SOURCE" >&2
  exit 1
fi

if [[ ! -d "$COMMANDS_SOURCE_DIR" ]]; then
  echo "Commands directory not found: $COMMANDS_SOURCE_DIR" >&2
  exit 1
fi

for cmd in "${REQUIRED_COMMANDS[@]}"; do
  if [[ ! -f "$COMMANDS_SOURCE_DIR/$cmd" ]]; then
    echo "Required command file not found: $COMMANDS_SOURCE_DIR/$cmd" >&2
    exit 1
  fi
done

mkdir -p "$TARGET_DIR"
mkdir -p "$COMMANDS_TARGET_DIR"

cp -f "$SOURCE" "$TARGET"
cp -f "$COMMANDS_SOURCE_DIR"/*.md "$COMMANDS_TARGET_DIR"/
echo "Installed: $TARGET"
echo "Installed commands: $COMMANDS_TARGET_DIR"
