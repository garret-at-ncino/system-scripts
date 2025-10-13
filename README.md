# system-scripts

System automation and setup scripts for managing development environments.

## tmux/

Tmux session management scripts that create or re-attach to predefined session layouts with multiple windows.

### `main.sh`

Creates/attaches to the **main** tmux session with 4 windows:

- **home** - Primary window with fastfetch display
- **docs** - Opens `product-security-docs` repository
- **projects** - Opens general `Projects/` directory
- **other** - Throwaway window for misc tasks

### `batch-change.sh`

Creates/attaches to the **batch-change** tmux session with 4 windows:

- **home** - Primary window with fastfetch display
- **batch** - Opens `sourcegraph-batch-change-library` repository
- **colima** - Starts colima and SSH session
- **other** - Throwaway window for misc tasks

## Usage

```bash
# Run any script directly
./tmux/main.sh
./tmux/batch-change.sh
```

All scripts handle shell aliases (like `lls`) by sourcing `~/.zshrc` and will safely re-attach if the session already exists.
