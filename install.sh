#!/usr/bin/env bash
set -euo pipefail

usage() {
  printf 'Usage: %s [codex|claude|all]\n' "${0##*/}"
}

target="${1:-all}"
case "$target" in
  codex|claude|all) ;;
  -h|--help) usage; exit 0 ;;
  *) usage >&2; exit 2 ;;
esac

source_dir="$(cd -- "$(dirname -- "$0")" && pwd -P)"

install_skill() {
  local root="$1"
  local destination="$root/traction-leads-strategy"
  mkdir -p "$destination"
  rsync -a --delete \
    --exclude '.git/' \
    --exclude '.gitignore' \
    --exclude 'README.md' \
    --exclude 'LICENSE' \
    --exclude 'install.sh' \
    "$source_dir/" "$destination/"
  printf 'Installed traction-leads-strategy in %s\n' "$destination"
}

if [[ "$target" == "codex" || "$target" == "all" ]]; then
  install_skill "${CODEX_HOME:-$HOME/.codex}/skills"
fi

if [[ "$target" == "claude" || "$target" == "all" ]]; then
  install_skill "${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills"
fi
