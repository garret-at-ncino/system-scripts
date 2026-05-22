# Tmux Session Management Scripts

Scripts for creating and attaching to named tmux sessions with consistent
layouts and a shared utility library.

## Scripts

- **`setup-main.sh`** — General-purpose session
- **`setup-dev.sh`** — Development-focused session
- **`setup-batch-change.sh`** — Batch change workflow session
- **`session-manager.sh`** — List, inspect, and kill sessions
- **`tmux-utils.sh`** — Shared utility functions (sourced by setup scripts)

## Usage

```bash
# Start (or attach to) a session
./setup-main.sh
./setup-dev.sh
./setup-batch-change.sh

# Manage sessions
./session-manager.sh list
./session-manager.sh info <session>
./session-manager.sh kill <session>
./session-manager.sh killall
./session-manager.sh --help
```

## Session Layouts

### Main (`main`)

| Window | Directory |
|---|---|
| btop | `~` |
| home | `~` |
| projects | `~/Projects` |
| claude-code | `~/Projects` |

### Development (`dev`)

| Window | Directory |
|---|---|
| btop | `~` |
| home | `~` |
| claude-code | `~/Projects` |
| projects | `~/Projects` |
| neovim | `~/Projects` |
| git | `~/Projects` |

### Batch Change (`batch-change`)

| Window | Directory |
|---|---|
| btop | `~` |
| home | `~` |
| batch | `~/Projects/ncino/sourcegraph-batch-change-library` |
| colima | `~/Projects/ncino/sourcegraph-batch-change-library` |

## Logging

Each session logs to `~/.tmux-session-<name>.log`.

## Dependencies

- **tmux**
- **bash** 4.0+

## Troubleshooting

- **Permission denied** — `chmod +x *.sh`
- **tmux not found** — `brew install tmux`
- **Session already exists** — `./session-manager.sh list` to see active sessions
