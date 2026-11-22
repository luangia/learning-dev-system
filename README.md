# learning-dev-system

My learning-driven development workflow for Claude Code: a rulebook (`AGENTS.md`)
plus ten slash commands that walk a project from plan → stage-by-stage build → portfolio.

## Layout

```
AGENTS.md            the rules Claude follows in opted-in projects
commands/            slash commands (linked to ~/.claude/commands/learn)
templates/CLAUDE.md  one-line file that opts a project in
install.sh           creates the links in ~/.claude
```

## Install (macOS / Linux)

```bash
git clone git@github.com:YOUR-USER/learning-dev-system.git ~/dev/learning-dev-system
cd ~/dev/learning-dev-system
./install.sh
```

This creates two symlinks:

- `~/.claude/commands/learn` → `commands/` (slash commands available in every project)
- `~/.claude/learning-system` → this repo (so projects can import `AGENTS.md`)

Because they're links, editing files here takes effect immediately everywhere.

**Windows:** symlinks need Developer Mode or an admin terminal. Either run
`mklink /D` for the two links above, or just copy `commands\` to
`%USERPROFILE%\.claude\commands\learn` and the repo to `%USERPROFILE%\.claude\learning-system`
(re-copy after changes).

## Start a project

```bash
mkdir my-project && cd my-project && git init
cp ~/dev/learning-dev-system/templates/CLAUDE.md .
claude
```

Then in Claude Code:

```
/init-project Name: ... Idea: ... Learn: ... Goals: ... Timeline: 2 weeks
```

Check it loaded with `/memory` — you should see CLAUDE.md and AGENTS.md. Claude Code may
ask you to approve the AGENTS.md import the first time, since it lives outside the project.

Only projects with this CLAUDE.md follow the workflow. Other projects are unaffected
(the slash commands still appear in the `/` menu everywhere, which is harmless).

## The commands

| Command | When | What it does |
|---|---|---|
| `/init-project <details>` | New project | Plan + docs only, no code |
| `/prepare-stage` | Before each stage | Teaches the next stage, proposes a checklist |
| `/implement-stage <n>` | After you approve | Builds stage n only, tests, reports, stops |
| `/deep-dive <topic>` | Anytime | In-depth lesson, saved to docs/learning/ |
| `/knowledge-check <n>` | After a stage | Interactive quiz, one question at a time |
| `/review <what>` | After you write code | Senior-engineer review, no rewrites |
| `/stage-review` | End of a stage | Audits acceptance criteria, then stops |
| `/advance` | Ready to move on | Verifies current stage, prepares the next |
| `/audit` | Occasionally | Whole-project technical audit |
| `/portfolio` | Project done | README, resume bullets, interview prep |

Typical loop per stage: `/prepare-stage` → `/implement-stage N` → `/knowledge-check N`
→ `/stage-review` → `/advance` (which prepares stage N+1).

## Publishing a project

A project's CLAUDE.md points at `~/.claude/learning-system/`, which only exists on
your machine. Before publishing, replace the import with a real copy:

```bash
cp ~/dev/learning-dev-system/AGENTS.md ./AGENTS.md
echo "@AGENTS.md" > CLAUDE.md
```

`/portfolio` will remind you.

## Changes from the original PROMPTS.md

- Each command is its own slash command file; `[PLACEHOLDERS]` became `$ARGUMENTS`.
- Command 8 (duplicate name "Prepare Next Stage") is now `/advance`.
- AGENTS.md §9 now says its end-of-stage questions are a lightweight review, and that
  `/knowledge-check` uses its own format — so the two no longer conflict.
- AGENTS.md §13 maps each instruction to its slash command.
- PROMPTS.md itself is no longer needed.
