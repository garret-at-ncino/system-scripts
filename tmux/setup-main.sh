#!/bin/bash

# Main tmux session — btop (~), home (~), projects (~/Projects/ncino + lls), claude-code (~/Projects/ncino + lls)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=tmux-utils.sh
source "${SCRIPT_DIR}/tmux-utils.sh"

readonly SESSION_NAME='main'

create_session() {
    log "${SESSION_NAME}" "Creating new tmux session: ${SESSION_NAME}"

    if ! tmux new-session -d -s "${SESSION_NAME}" -c "${HOME}" -n 'btop'; then
        error_exit "Failed to create tmux session: ${SESSION_NAME}"
    fi

    configure_session_options "${SESSION_NAME}" "green"

    prepare_tmux_pane "${SESSION_NAME}:btop" "${HOME}" 'btop'

    tmux new-window -t "${SESSION_NAME}" -n 'home' -c "${HOME}"
    prepare_tmux_pane "${SESSION_NAME}:home" "${HOME}" 'clear'

    tmux new-window -t "${SESSION_NAME}" -n 'projects' -c "${HOME}/Projects/ncino"
    prepare_tmux_pane "${SESSION_NAME}:projects" "${HOME}/Projects/ncino" 'clear' 'lls'

    tmux new-window -t "${SESSION_NAME}" -n 'claude-code' -c "${HOME}/Projects/ncino"
    prepare_tmux_pane "${SESSION_NAME}:claude-code" "${HOME}/Projects/ncino" 'clear' 'lls'

    log "${SESSION_NAME}" "Session ${SESSION_NAME} created (windows: btop, home, projects, claude-code)"
}

attach_session() {
    log "${SESSION_NAME}" "Attaching to existing session: ${SESSION_NAME}"
    tmux attach-session -t "${SESSION_NAME}"
}

main() {
    log "${SESSION_NAME}" "Starting tmux setup for: ${SESSION_NAME}"
    check_tmux_installed

    if session_exists "${SESSION_NAME}"; then
        log "${SESSION_NAME}" "Session ${SESSION_NAME} already exists"
        attach_session
    else
        create_session
        tmux select-window -t "${SESSION_NAME}:home"
        attach_session
    fi
}

main "$@"
