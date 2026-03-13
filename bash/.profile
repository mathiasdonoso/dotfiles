# ~/.profile: sourced by login shells (display managers, SSH, TTY logins).
# Sets session-wide environment — available to all processes, not just bash terminals.
# Note: bash login shells read .bash_profile first; this file is for /bin/sh compatibility
# and display managers (LightDM, GDM) on Debian/Ubuntu/Pop!_OS.

# Source .bashrc for bash login shells (covers SSH and TTY logins)
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# PATH helpers — checked before adding to avoid duplicates on re-source
_path_prepend() { case ":$PATH:" in *":$1:"*) ;; *) PATH="$1:$PATH" ;; esac; }

# User-local binaries (pip --user, cargo install, etc.)
[ -d "$HOME/.local/bin" ] && _path_prepend "$HOME/.local/bin"
[ -d "$HOME/bin" ]        && _path_prepend "$HOME/bin"

# Go
[ -d "/usr/local/go/bin" ] && _path_prepend "/usr/local/go/bin"
[ -d "$HOME/go/bin" ]      && _path_prepend "$HOME/go/bin"

# Bun
[ -d "$HOME/.bun/bin" ] && _path_prepend "$HOME/.bun/bin"

export PATH

# Session-wide editor defaults
export EDITOR=vim
export VISUAL=vim

# Go workspace
export GOPATH="$HOME/go"

# Bun
export BUN_INSTALL="$HOME/.bun"

# Cargo / Rust
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# ghcup (Haskell) — guarded, only present if installed
[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env"

# opam (OCaml) — guarded, only present if installed
[ -r "$HOME/.opam/opam-init/init.sh" ] && . "$HOME/.opam/opam-init/init.sh" > /dev/null 2>&1 || true
