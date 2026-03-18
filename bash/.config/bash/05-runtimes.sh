# Cargo / Rust
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# NVM (Node version manager)
if [ -s "$HOME/.nvm/nvm.sh" ]; then
    source "$HOME/.nvm/nvm.sh"
    [ -s "$HOME/.nvm/bash_completion" ] && source "$HOME/.nvm/bash_completion"
fi

# GVM (Go version manager) — only needed when managing multiple Go versions
[ -s "$HOME/.gvm/scripts/gvm" ] && source "$HOME/.gvm/scripts/gvm"

# uv (Python)
command -v uv &>/dev/null && eval "$(uv generate-shell-completion bash)"

# Bun
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Jujutsu
command -v jj >/dev/null 2>&1 && source <(jj util completion bash)
