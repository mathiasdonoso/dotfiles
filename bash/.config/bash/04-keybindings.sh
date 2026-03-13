# Disable ctrl+s (flow control)
stty -ixon

# fzf shell integration — handles both apt and manual installs
_fzf_bindings="/usr/share/doc/fzf/examples/key-bindings.bash"
if [ -f "$_fzf_bindings" ]; then
    source "$_fzf_bindings"
elif [ -f "$HOME/.fzf.bash" ]; then
    source "$HOME/.fzf.bash"
fi
unset _fzf_bindings

# Custom bindings
bind '"\C-f": "f\nclear\n"'
bind '"\C-t": "t\nclear\n"'
bind '"\C-s": "s\nclear\n"'
bind '"\C-k": "kill_tmux_sessions\nclear\n"'

if command -v fzf >/dev/null; then
  __fzf_history__() {
    local selected
    selected=$(history | tac | sed 's/^ *[0-9]* *//' | fzf --height 40% --reverse --border)
    if [ -n "$selected" ]; then
      READLINE_LINE="$selected"
      READLINE_POINT=${#READLINE_LINE}
    fi
  }
  bind -x '"\C-r": __fzf_history__'
fi
