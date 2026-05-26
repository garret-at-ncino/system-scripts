#!/bin/bash

# Batch change tmux session — btop, home, batch (sourcegraph-batch-change-library), colima

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=tmux-utils.sh
source "${SCRIPT_DIR}/tmux-utils.sh"

readonly SESSION_NAME='batch-change'
readonly BATCH_DIR="${HOME}/Projects/ncino/sourcegraph-batch-change-library"

create_session() {
    log "${SESSION_NAME}" "Creating new tmux session: ${SESSION_NAME}"

    if ! tmux new-session -d -s "${SESSION_NAME}" -c "${HOME}" -n 'btop'; then
        error_exit "Failed to create tmux session: ${SESSION_NAME}"
    fi

    configure_session_options "${SESSION_NAME}" "magenta"
    create_main_session_windows "${SESSION_NAME}"

    tmux new-window -t "${SESSION_NAME}" -n 'batch' -c "${BATCH_DIR}"
    prepare_tmux_pane "${SESSION_NAME}:batch" "${BATCH_DIR}" 'lls'

    tmux new-window -t "${SESSION_NAME}" -n 'colima' -c "${BATCH_DIR}"
    prepare_tmux_pane "${SESSION_NAME}:colima" "${BATCH_DIR}" 'clear' 'colima start' 'colima ssh'

    log "${SESSION_NAME}" "Session ${SESSION_NAME} created (windows: btop, home, batch, colima)"
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
