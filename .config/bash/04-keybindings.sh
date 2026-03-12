# Disable ctrl+s (flow control)
stty -ixon

# Custom bindings
bind '"\C-f": "f\nclear\n"'
bind '"\C-t": "t\nclear\n"'
bind '"\C-s": "s\nclear\n"'
bind '"\C-k": "kill-tmux-sessions\nclear\n"'

# fzf shell integration — handles both apt and manual installs
_fzf_bindings="/usr/share/doc/fzf/examples/key-bindings.bash"
if [ -f "$_fzf_bindings" ]; then
    source "$_fzf_bindings"
elif [ -f "$HOME/.fzf.bash" ]; then
    source "$HOME/.fzf.bash"
fi
unset _fzf_bindings
