parse_git_branch() {
    command -v git >/dev/null || return
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

changebg() {
    command -v feh >/dev/null || return
    feh --bg-fill --no-fehbg --randomize "$HOME/Pictures/anime/"*.{png,jpg,jpeg}
}

f() {
    command -v fzf >/dev/null || return
    command -v fd >/dev/null || return
    local selected
    selected=$(fd . "$HOME/code" --type d --min-depth 2 --max-depth 2 | fzf) || return
    cd "$selected"
}

t() {
    command -v fzf >/dev/null || return
    command -v tmux >/dev/null || return
    local sessions selected
    sessions=$(tmux ls 2>/dev/null) || { echo "No tmux sessions."; return 1; }
    selected=$(echo "$sessions" | fzf | awk -F: '{print $1}') || return
    tmux attach -t "$selected"
}

s() {
    command -v tmux >/dev/null || return
    tmux new-session -s "$(basename "$PWD")"
}

kill_tmux_sessions() {
    command -v tmux >/dev/null || return
    tmux kill-server && echo "Tmux server killed."
}
