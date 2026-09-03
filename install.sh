#!/usr/bin/env bash
set -euo pipefail

usage() {
  printf 'Usage: %s [codex|claude|all]\n' "${0##*/}"
  printf '\nOptional installer-only overrides:\n'
  printf '  CODEX_SKILLS_DIR   Default: $HOME/.agents/skills\n'
  printf '  CLAUDE_SKILLS_DIR  Default: $HOME/.claude/skills\n'
}

target="${1:-all}"
case "$target" in
  codex|claude|all) ;;
  -h|--help) usage; exit 0 ;;
  *) usage >&2; exit 2 ;;
esac

source_dir="$(cd -- "$(dirname -- "$0")" && pwd -P)"
skill_name="traction-leads-strategy"

validate_source() {
  test -f "$source_dir/SKILL.md"
  grep -q '^name: traction-leads-strategy$' "$source_dir/SKILL.md"
  grep -q '^description: .' "$source_dir/SKILL.md"
}

install_skill() {
  local root="$1"
  local product="$2"
  local destination="$root/$skill_name"
  local staging
  local backup
  local backup_root

  mkdir -p "$root"
  staging="$(mktemp -d "$root/.${skill_name}.install.XXXXXX")"
  mkdir -p "$staging/agents"
  cp "$source_dir/SKILL.md" "$staging/SKILL.md"
  cp "$source_dir/agents/openai.yaml" "$staging/agents/openai.yaml"

  cmp -s "$source_dir/SKILL.md" "$staging/SKILL.md"
  cmp -s "$source_dir/agents/openai.yaml" "$staging/agents/openai.yaml"

  if [[ -e "$destination" || -L "$destination" ]]; then
    backup_root="$(dirname -- "$root")/skill-backups"
    mkdir -p "$backup_root"
    backup="$backup_root/${skill_name}.$(date +%Y%m%d%H%M%S).$$"
    mv "$destination" "$backup"
    printf 'Preserved previous installation at %s\n' "$backup"
  fi

  mv "$staging" "$destination"
  test -f "$destination/SKILL.md"
  printf 'Installed for %s at %s\n' "$product" "$destination"
}

validate_source

if [[ "$target" == "codex" || "$target" == "all" ]]; then
  install_skill "${CODEX_SKILLS_DIR:-$HOME/.agents/skills}" "Codex"
fi

if [[ "$target" == "claude" || "$target" == "all" ]]; then
  install_skill "${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}" "Claude Code"
fi

printf '\nCodex detects skill changes automatically; restart it if the skill does not appear.\n'
printf 'Claude Code watches existing skill directories; restart it if this install created the top-level skills directory.\n'
