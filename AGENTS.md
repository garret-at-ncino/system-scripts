# Agent guidance

This repository holds **shell scripts** for macOS/Linux: **tmux** session
helpers under `tmux/` and **git backup** utilities under `code-backup/`. There
is no application runtime; changes are almost always Bash and documentation.

## Layout

- **`tmux/`** — `setup-main.sh`, `setup-dev.sh`, `setup-batch-change.sh`,
  `session-manager.sh`; shared helpers in `tmux-utils.sh`
- **`code-backup/`** — `code-backup-local.sh`, `code-backup-gitlab.sh`
- **`.github/workflows/`** — PR quality checks (reusable workflow)

See [README.md](README.md), [tmux/README.md](tmux/README.md), and
[code-backup/README.md](code-backup/README.md) for usage and behavior.

## Conventions (shell)

- Prefer patterns already used in `tmux/`: strict mode (`set -euo pipefail`
  where appropriate), clear errors, colored messages, logging where the rest
  of the script logs.
- Quote expansions; avoid word-splitting and pathname surprises on user paths.
- `tmux-utils.sh` is **sourced** by other scripts—keep public function names
  and side effects consistent with callers.
- Assume **tmux** and **bash** (4.0+); do not introduce dependencies without
  a strong reason and documentation.

## Conventions (repo)

- **Prettier** is configured for formatting; `package.json` only lists Prettier
  as a dev dependency.
- CI runs **shellcheck**, **markdownlint**, **prettier**, **yamllint**, and
  other linters via a reusable workflow—scripts and markdown under linted
  paths should stay clean.

## tmux session scripts — known pitfalls

- **`set -euo pipefail` + `&&` short-circuit:** The pattern
  `[[ -f file ]] && command` returns exit code 1 when the file is absent,
  which kills the script under `set -e`. Always use `if [[ -f ]]; then ...; fi`
  instead.
- **Inline all windows per script:** Shared helpers like
  `create_main_session_windows` that create fixed windows are fragile — they
  bake in paths and startup commands that differ per session. Each setup script
  should declare its own `btop` and `home` windows directly inside
  `create_session` so the full layout is visible in one place.
- **Per-script working directories:** Session scripts for ncino work should
  default windows to `~/Projects/ncino`, not `~/Projects`. Verify the actual
  intended `cwd` against what each window comment says before shipping.

## What to do when editing

1. Read the target script and any scripts that `source` it before changing
   behavior.
2. Match naming, logging, and error style of neighboring code.
3. Run **shellcheck** on edited shell files and **prettier** on touched
   markdown/JSON/YAML when relevant.
4. Update the nearest `README.md` only when behavior, flags, or paths visible
   to users change.

## Out of scope

- Do not add unrelated languages, frameworks, or large refactors unless the
  user asks.
- Do not commit secrets, tokens, or machine-specific absolute paths meant for
  one developer only.
