# System Scripts

A collection of system administration and development workflow scripts for
macOS/Linux environments.

## 📁 Project Structure

```text
system-scripts/
├── code-backup/          # Repository backup and management
├── git-scripts/          # Git repository utilities
├── tmux/                 # Enhanced tmux session management
└── README.md            # This file
```

## 🔧 Scripts Overview

### 📦 Code Backup (`code-backup/`)

Comprehensive repository backup and management system with:

- Automated git operations (pull, push, status checking)
- Selective repository filtering
- Detailed logging and error handling
- Progress tracking and reporting

**Key Features:**

- ✅ Intelligent repository detection
- ✅ Git status validation before operations
- ✅ Comprehensive logging system
- ✅ Error handling and recovery
- ✅ Progress indicators and reporting

### 🔧 Git Utilities (`git-scripts/`)

Utilities for managing multiple git repositories:

- `sync-all.sh` - Find all git repos in a path and update their default branch

**Key Features:**

- ✅ **Automatic Detection**: Identifies default branch (main/master/HEAD)
- ✅ **Safe Updates**: Skips repositories with uncommitted changes
- ✅ **Recursive Discovery**: Finds all git repos within a given path
- ✅ **Clean Fetch**: Prunes deleted remote branches during fetch

### 🖥️ Tmux Session Management (`tmux/`)

Enhanced tmux session management following bash and tmux best practices:

**Core Scripts:**

- `setup-main.sh` - General-purpose session
- `setup-dev.sh` - Development-focused session
- `setup-batch-change.sh` - Batch change workflow session
- `session-manager.sh` - Comprehensive session manager
- `tmux-utils.sh` - Shared utility functions

**Key Features:**

- ✅ **Bash Best Practices**: Strict error handling, proper quoting, logging
- ✅ **Tmux Best Practices**: Session management, window organization
- ✅ **Error Handling**: Comprehensive validation and colored output
- ✅ **Logging**: Timestamped logs with session-specific files

## 🚀 Quick Start

### Customizing Code Backup

```bash
# Run backup for all repositories
./code-backup/code-backup.sh

# Run with specific options
./code-backup/code-backup.sh --help
```

## 📋 Session Layouts

### Main Session (`main`)

- **btop** - System monitor
- **home** - Home directory (`~`)
- **projects** - Projects directory (`~/Projects`)
- **claude-code** - Claude Code workspace (`~/Projects`)

### Development Session (`dev`)

- **btop** - System monitor
- **home** - Home directory (`~`)
- **claude-code** - Claude Code workspace (`~/Projects`)
- **projects** - Projects directory (`~/Projects`)
- **neovim** - Editor workspace (`~/Projects`)
- **git** - Git/version control workspace (`~/Projects`)

### Batch Change Session (`batch-change`)

- **btop** - System monitor
- **home** - Home directory (`~`)
- **batch** - Batch change library (`~/Projects/ncino/sourcegraph-batch-change-library`)
- **colima** - Colima VM management (`~/Projects/ncino/sourcegraph-batch-change-library`)

## 🛠️ Dependencies

- **bash** 4.0+ (for enhanced features)
- **tmux** (for session management)
- **git** (for code backup)
- **macOS/Linux** environment

## 📝 Logging

All scripts include comprehensive logging:

- `~/.tmux-session-*.log` - Tmux session logs
- `code-backup/logs/` - Backup operation logs
- Colored output for better visibility
- Timestamped entries with context

### Customizing Tmux Sessions

- Modify window layouts in the respective setup scripts
- Add custom commands and working directories
- Customize status bar appearance
- Add new specialized windows

### Code Backup

- Configure repository paths and filters
- Adjust backup schedules and options
- Customize logging and reporting

## 📚 Documentation

- [Tmux Scripts Documentation](tmux/README.md)
- [Code Backup Documentation](code-backup/README.md)

## 🤝 Contributing

When modifying scripts:

1. Follow bash best practices (`set -euo pipefail`, proper quoting)
2. Maintain comprehensive error handling
3. Update documentation and logging
4. Test with different scenarios
5. Keep consistent code style

## 📄 License

See [LICENSE](LICENSE) file for details.
