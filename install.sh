#!/usr/bin/env bash
# Links this repo into ~/.claude so Claude Code can find the commands and AGENTS.md.
# Safe to re-run. Works from wherever you cloned the repo.
set -euo pipefail

REPO="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

link() {
  local target="$1" linkpath="$2"
  if [ -e "$linkpath" ] && [ ! -L "$linkpath" ]; then
    echo "!! $linkpath already exists and is not a symlink. Move it aside and re-run." >&2
    exit 1
  fi
  ln -sfn "$target" "$linkpath"
  echo "linked $linkpath -> $target"
}

mkdir -p "$CLAUDE_DIR/commands"
link "$REPO/commands" "$CLAUDE_DIR/commands/learn"
link "$REPO"          "$CLAUDE_DIR/learning-system"

echo
echo "Done. In a new project, run:"
echo "  cp \"$REPO/templates/CLAUDE.md\" ./CLAUDE.md"
echo "Then open Claude Code there and type /init-project"
