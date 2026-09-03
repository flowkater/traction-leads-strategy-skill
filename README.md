# Traction & Leads Strategy

[한국어 문서](README.ko.md)

An Agent Skill for diagnosing acquisition, offer, funnel, and channel decisions before committing to tactical execution. It helps Codex or Claude Code turn a vague growth request into a grounded decision, a recommended path, and a bounded experiment with explicit success and stop rules.

## What this skill does

Growth problems are often misclassified as traffic problems. This skill first identifies the active product, customer, offer, funnel, evidence, economics, and constraints. It then maps the journey from reach to engagement, qualification, purchase, activation, retention, and referral to identify the binding constraint.

Depending on the request, it produces one of four focused outputs:

- **Narrow audit:** a verdict on a landing page, campaign, offer, or funnel decision; evidence coverage; the binding constraint; prioritized fixes; and validation steps.
- **Strategy:** a traction goal or learning decision; context and assumptions; distinct strategic options; one recommendation; and a `now / after signal / defer` roadmap.
- **Experiment design:** a hypothesis, real market contact, budget and duration, metrics, pre-registered success and stop rules, and the next action for each outcome.
- **Result validation:** a comparison with the original criterion, cohort and data-quality checks, a verdict, alternative explanations, and a `scale / repeat / revise / stop / inconclusive` decision.

Its channel logic is stage-aware:

- If no repeatable channel is known, it considers diverse routes and proposes small comparable tests before focusing.
- If attention exists but conversion is weak, it examines the offer, promise, proof, qualification, and activation path before recommending more traffic.
- If a route already works, it prioritizes more of the proven input, improvement at the binding constraint, and only then genuinely new placements or methods.
- It recommends leverage through referrals, partners, affiliates, employees, or agencies only when process, economics, and operating capacity support it.

## What this skill does not do

This is a strategic decision skill, not a tactical execution bundle. Once the strategic decision is fixed, use a dedicated tool or skill for copywriting, CRO implementation, SEO, ad operations, prospect sourcing, outreach, or analytics engineering.

Invoking the skill does not authorize ad spend, customer contact, publishing, payments, account changes, or external sharing. Vanity metrics such as impressions, followers, installs, and unqualified leads are not treated as traction without downstream quality and business evidence.

## Good use cases

- Identify why a funnel is not producing qualified or activated customers.
- Choose which acquisition channels deserve inexpensive tests.
- Design a first-customer or beta recruitment strategy.
- Audit whether a landing page supports the current offer and desired action.
- Decide whether a marketing result should be scaled, repeated, revised, stopped, or treated as inconclusive.
- Separate an acquisition problem from an offer, sales, product, retention, economics, or capacity problem.

## Example prompts

Codex explicit invocation:

```text
Use $traction-leads-strategy to identify the binding constraint in this funnel and design the cheapest credible test.
```

Claude Code explicit invocation:

```text
/traction-leads-strategy Audit this beta recruitment page and tell me what must be validated before increasing traffic.
```

Both products can also select the skill automatically when the request matches its description.

## Compatibility

The repository follows the common Agent Skills shape: a skill directory containing a `SKILL.md` file with YAML frontmatter and Markdown instructions. The same `SKILL.md` is installed unchanged for both products.

| Product | Personal skill path | Project skill path | Explicit invocation |
| --- | --- | --- | --- |
| Codex | `~/.agents/skills/traction-leads-strategy/SKILL.md` | `.agents/skills/traction-leads-strategy/SKILL.md` | `$traction-leads-strategy` |
| Claude Code | `~/.claude/skills/traction-leads-strategy/SKILL.md` | `.claude/skills/traction-leads-strategy/SKILL.md` | `/traction-leads-strategy` |

References: [OpenAI Codex Skills documentation](https://developers.openai.com/codex/skills) and [Anthropic Claude Code Skills documentation](https://code.claude.com/docs/en/skills).

## Install for personal use

Prerequisites: Git and a POSIX shell with standard `cp`, `cmp`, `grep`, `mktemp`, and `mv` commands. The installer is tested on macOS and Linux. It does not require `rsync` and does not delete an existing installation. If the target already exists, it is moved to a timestamped backup outside the discoverable `skills` directory before the new copy is installed.

```bash
git clone https://github.com/flowkater/traction-leads-strategy-skill.git
cd traction-leads-strategy-skill
./install.sh all
```

Install only one target if preferred:

```bash
./install.sh codex
./install.sh claude
```

The defaults can be overridden for testing or nonstandard layouts with the installer-only `CODEX_SKILLS_DIR` and `CLAUDE_SKILLS_DIR` environment variables. These are conveniences provided by this repository, not product configuration variables.

After installation, Codex normally detects skill changes automatically; restart it if the skill does not appear. Claude Code watches skill directories in the current session, but you should restart it if the install created the top-level skills directory after the session started.

## Install in one project

For Codex:

```bash
mkdir -p .agents/skills/traction-leads-strategy/agents
cp SKILL.md .agents/skills/traction-leads-strategy/SKILL.md
cp agents/openai.yaml .agents/skills/traction-leads-strategy/agents/openai.yaml
```

For Claude Code:

```bash
mkdir -p .claude/skills/traction-leads-strategy
cp SKILL.md .claude/skills/traction-leads-strategy/SKILL.md
```

Commit the project-local skill if it should be shared with that repository's collaborators or cloud sessions.

## Verify the installation

Run the repository's isolated installer test:

```bash
./scripts/test-install.sh
```

Then confirm the personal files for the products you installed:

```bash
test -f "$HOME/.agents/skills/traction-leads-strategy/SKILL.md"
test -f "$HOME/.claude/skills/traction-leads-strategy/SKILL.md"
```

Finally, start a fresh conversation and invoke the skill explicitly using the syntax in the compatibility table. File presence proves installation; successful discovery and invocation prove that the running product loaded it.

## Update and recovery

Pull the repository and run the same installer again:

```bash
git pull --ff-only
./install.sh all
```

An existing target is preserved outside the discovery directory. With the default paths, backups are stored under `~/.agents/skill-backups/` for Codex and `~/.claude/skill-backups/` for Claude Code, with a name such as `traction-leads-strategy.20260903153000.12345`. To roll back, close the relevant product, move the new directory aside, and move the chosen backup back to the product's `skills/traction-leads-strategy` path.

## Content boundary and attribution

This public edition contains original, high-level operating guidance only. It does not include private study notes, translations, chapter mappings, source manifests, or copied passages from *Traction* or *$100M Leads*. Those works remain their respective authors' and publishers' property. This project is not affiliated with or endorsed by them.
