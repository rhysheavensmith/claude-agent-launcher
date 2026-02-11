# Claude Agent Teams
export CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1

claude-team() {
    local session_name="${1:-agents}"

    if tmux has-session -t "$session_name" 2>/dev/null; then
        echo "Session exists. Attaching..."
        if [[ "$TERM_PROGRAM" == "iTerm.app" && "$CT_ITERM_CC" == "1" ]]; then
            tmux -CC attach -t "$session_name"
        else
            tmux attach -t "$session_name"
        fi
    else
        echo "Starting agent team: $session_name"
        if [[ "$TERM_PROGRAM" == "iTerm.app" && "$CT_ITERM_CC" == "1" ]]; then
            tmux -CC new -s "$session_name" "claude --teammate-mode tmux --dangerously-skip-permissions"
        else
            tmux new -s "$session_name" "claude --teammate-mode tmux --dangerously-skip-permissions"
        fi
    fi
}

alias ct='claude-team'
alias ct-kill='tmux kill-session -t'
alias ct-list='tmux ls'
