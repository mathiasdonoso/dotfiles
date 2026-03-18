export EDITOR=vim
export VISUAL=vim

export GOPATH="$HOME/go"
export BUN_INSTALL="$HOME/.bun"
export PNPM_HOME="$HOME/.local/share/pnpm"

[[ -x "$(command -v bat)" && -d "$(bat --config-dir)/themes/ayu-bat" ]] && export BAT_THEME="ayu-dark" || export BAT_THEME="base16"

# Prepend to PATH only if not already present
path_prepend() { [[ ":$PATH:" != *":$1:"* ]] && export PATH="$1:$PATH"; }

[[ -d "$HOME/.local/bin" ]] && path_prepend "$HOME/.local/bin"
[[ -d "$HOME/.bun/bin" ]] && path_prepend "$HOME/.bun/bin"
[[ -d "$HOME/go/bin" ]] && path_prepend "$HOME/go/bin"
[[ -d "$HOME/.local/scripts" ]] && path_prepend "$HOME/.local/scripts"
[[ -d "/usr/local/go/bin" ]] && path_prepend "/usr/local/go/bin"
[[ -d "$PNPM_HOME" ]] && path_prepend "$PNPM_HOME"
