# system-scripts

System automation and setup scripts for managing development environments.

## tmux/

Tmux session management scripts that create or re-attach to predefined session layouts with multiple windows.

### `main.sh`

Creates/attaches to the **main** tmux session with 4 windows:

- **home** - Primary window with fastfetch display (starts in `$HOME`)
- **system** - Runs `btop` system monitor
- **projects** - Opens general `Projects/` directory
- **other** - Throwaway window for misc tasks (starts in `$HOME`)

### `batch-change.sh`

Creates/attaches to the **batch-change** tmux session with 4 windows:

- **home** - Primary window with fastfetch display (starts in `$HOME`)
- **batch** - Opens `ncino/sourcegraph-batch-change-library` repository
- **colima** - Starts colima and SSH session (starts in `ncino/sourcegraph-batch-change-library`)
- **other** - Throwaway window for misc tasks (starts in `$HOME`)

## Usage

```bash
# Run any script directly
./tmux/main.sh
./tmux/batch-change.sh
```

All scripts handle shell aliases (like `lls`) by sourcing `~/.zshrc` and will safely re-attach if the session already exists.
