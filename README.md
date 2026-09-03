# Traction & Leads Strategy

A portable skill for making acquisition, offer, funnel, and channel decisions from evidence and bounded tests. It is intentionally strategy-first: it does not authorize outreach, publishing, ad spend, or other external execution.

The skill is compatible with both Codex and Claude Code because each discovers a skill from a directory containing `SKILL.md`.

## Install

Clone the repository, then install it into either or both local skill directories:

```bash
git clone https://github.com/flowkater/traction-leads-strategy-skill.git
cd traction-leads-strategy-skill
./install.sh all
```

Use `./install.sh codex` or `./install.sh claude` to install one target only. Re-run the same command after pulling an update.

For a project-local Claude Code skill, copy this repository into `.claude/skills/traction-leads-strategy/` in that project.

## Use

Invoke it explicitly when desired:

```text
Use $traction-leads-strategy to identify the binding constraint in this funnel and design the cheapest credible test.
```

## Content boundary

This public edition contains original, high-level operating guidance only. It does not include private study notes, translations, chapter mappings, source manifests, or copied passages from *Traction* or *$100M Leads*. Those works remain their respective authors' and publishers' property; this project is not affiliated with or endorsed by them.
