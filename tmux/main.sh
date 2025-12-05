#!/bin/bash

SESSION='main'

# Check if session already exists
tmux has-session -t "$SESSION" 2>/dev/null

if [ $? != 0 ]; then
    # Create new detached session
    tmux new-session -d -s "$SESSION"

    # Window 0: home
    tmux rename-window -t "$SESSION:0" 'home'
    tmux send-keys -t "$SESSION:0" "cd $HOME && clear && echo '' && fastfetch" C-m

    # Window 1: system
    tmux new-window -t "$SESSION:1" -n 'system'
    tmux send-keys -t "$SESSION:1" "source ~/.zshrc && btop" C-m

    # Window 2: projects
    tmux new-window -t "$SESSION:2" -n 'projects'
    tmux send-keys -t "$SESSION:2" "source ~/.zshrc && cd $HOME/Projects/ && clear && lls" C-m

    # Window 3: other
    tmux new-window -t "$SESSION:3" -n 'other'
    tmux send-keys -t "$SESSION:3" "source ~/.zshrc && cd $HOME && clear" C-m

    # Enable status bar
    tmux set-option -t "$SESSION" status on
fi

# Select the home window
tmux select-window -t "$SESSION:0"

# Attach to session (or switch if already inside tmux)
tmux attach-session -t "$SESSION"
