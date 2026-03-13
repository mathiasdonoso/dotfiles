export EDITOR=vim
export VISUAL=vim

export GOPATH="$HOME/go"
export BUN_INSTALL="$HOME/.bun"

# Prepend to PATH only if not already present
path_prepend() { [[ ":$PATH:" != *":$1:"* ]] && export PATH="$1:$PATH"; }

path_prepend "$HOME/.local/bin"
path_prepend "$HOME/.bun/bin"
path_prepend "$HOME/go/bin"
path_prepend "/usr/local/go/bin"
