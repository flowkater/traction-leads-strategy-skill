#!/usr/bin/env bash
set -euo pipefail

repository_root="$(cd -- "$(dirname -- "$0")/.." && pwd -P)"
test_root="$(mktemp -d "${TMPDIR:-/tmp}/traction-leads-install-test.XXXXXX")"

cleanup() {
  rm -rf -- "$test_root"
}
trap cleanup EXIT

codex_root="$test_root/codex-skills"
claude_root="$test_root/claude-skills"

CODEX_SKILLS_DIR="$codex_root" \
CLAUDE_SKILLS_DIR="$claude_root" \
  "$repository_root/install.sh" all

cmp -s \
  "$repository_root/SKILL.md" \
  "$codex_root/traction-leads-strategy/SKILL.md"
cmp -s \
  "$repository_root/SKILL.md" \
  "$claude_root/traction-leads-strategy/SKILL.md"

printf 'local customization\n' > "$codex_root/traction-leads-strategy/LOCAL_NOTE"

CODEX_SKILLS_DIR="$codex_root" \
  "$repository_root/install.sh" codex

backup="$(find "$test_root/skill-backups" -maxdepth 1 -type d -name 'traction-leads-strategy.*' -print -quit)"
test -n "$backup"
test -f "$backup/LOCAL_NOTE"
test ! -e "$codex_root/traction-leads-strategy.backup"
test ! -e "$codex_root/traction-leads-strategy/LOCAL_NOTE"
cmp -s \
  "$repository_root/SKILL.md" \
  "$codex_root/traction-leads-strategy/SKILL.md"

printf 'Installer test passed: both targets, copied content, update backup, and recovery artifact verified.\n'
