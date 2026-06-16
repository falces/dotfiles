#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZSHRC_SOURCE="$REPO_DIR/zshrc/.zshrc"
ZSHRC_TARGET="$HOME/.zshrc"

if [[ ! -f "$ZSHRC_SOURCE" ]]; then
  echo "Error: $ZSHRC_SOURCE not found." >&2
  exit 1
fi

if [[ -L "$ZSHRC_TARGET" ]]; then
  echo "Removing existing symlink: $ZSHRC_TARGET"
  rm "$ZSHRC_TARGET"
elif [[ -f "$ZSHRC_TARGET" ]]; then
  BACKUP="$ZSHRC_TARGET.backup.$(date +%Y%m%d%H%M%S)"
  echo "Backing up existing file to: $BACKUP"
  mv "$ZSHRC_TARGET" "$BACKUP"
fi

ln -s "$ZSHRC_SOURCE" "$ZSHRC_TARGET"
echo "Symlink created: $ZSHRC_TARGET -> $ZSHRC_SOURCE"
