#!/bin/bash
# Setup OWASP Cheat Sheet Series repository
# Usage: ./setup_cheatsheets.sh [target_directory]

set -euo pipefail

REPO="OWASP/CheatSheetSeries"
REPO_URL="https://github.com/OWASP/CheatSheetSeries.git"
DEFAULT_DIR="${HOME}/.local/share/owasp-cheatsheets"
TARGET_DIR="${1:-$DEFAULT_DIR}"

if ! command -v git >/dev/null 2>&1; then
    echo "Error: git が見つかりません。git をインストールしてから再実行してください。" >&2
    exit 1
fi

if [ -d "$TARGET_DIR/.git" ]; then
    echo "Updating existing repository..."
    git -C "$TARGET_DIR" pull --ff-only
else
    echo "Cloning OWASP Cheat Sheet Series..."
    if command -v gh >/dev/null 2>&1; then
        gh repo clone "$REPO" "$TARGET_DIR" -- --depth 1
    else
        git clone --depth 1 "$REPO_URL" "$TARGET_DIR"
    fi
fi

echo "Cheat sheets available at: $TARGET_DIR/cheatsheets"
echo "Done."
