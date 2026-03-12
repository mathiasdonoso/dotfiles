#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── Colors ────────────────────────────────────────────────────────────────────
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

log()  { echo -e "${GREEN}==>${NC} $*"; }
warn() { echo -e "${YELLOW}[warn]${NC} $*"; }
die()  { echo -e "${RED}[error]${NC} $*" >&2; exit 1; }

# ── Distro detection ──────────────────────────────────────────────────────────
detect_distro() {
  [ -f /etc/os-release ] || die "Cannot detect distro: /etc/os-release not found"
  # shellcheck source=/dev/null
  . /etc/os-release
  echo "$ID"
}

export DISTRO
DISTRO=$(detect_distro)

case "$DISTRO" in
  ubuntu|debian|pop|linuxmint)
    PKG_INSTALL="sudo apt install -y"
    PKG_UPDATE="sudo apt update"
    PKG_LIST="$DOTFILES_DIR/installers/packages/debian.txt"
    ;;
  fedora)
    PKG_INSTALL="sudo dnf install -y"
    PKG_UPDATE=""
    PKG_LIST="$DOTFILES_DIR/installers/packages/fedora.txt"
    ;;
  *)
    die "Unsupported distro: '$DISTRO'. Add support in install.sh and installers/packages/."
    ;;
esac

export PKG_INSTALL

# ── Temp dir (cleaned up on exit) ─────────────────────────────────────────────
WORK_DIR=$(mktemp -d)
trap 'rm -rf "$WORK_DIR"' EXIT
export WORK_DIR

# ── ~/.local/bin (install target for GitHub binaries) ─────────────────────────
LOCAL_BIN="$HOME/.local/bin"
mkdir -p "$LOCAL_BIN"

# ── Step 1: Package manager ───────────────────────────────────────────────────
log "[$DISTRO] Installing system packages..."
[ -n "$PKG_UPDATE" ] && $PKG_UPDATE
xargs $PKG_INSTALL < "$PKG_LIST"

# ── Step 2: GitHub binaries ───────────────────────────────────────────────────
log "Installing GitHub binaries to $LOCAL_BIN..."
for script in "$DOTFILES_DIR/installers/github/"*.sh; do
  # Each script defines BINARY, VERSION, and install_if_missing()
  # shellcheck source=/dev/null
  source "$script"
  install_if_missing
done

# ── Step 3: Runtimes ──────────────────────────────────────────────────────────
log "Installing language runtimes..."
for script in "$DOTFILES_DIR/installers/runtimes/"*.sh; do
  # Each script defines install_if_missing()
  # shellcheck source=/dev/null
  source "$script"
  install_if_missing
done

# ── Step 4: Git submodules ────────────────────────────────────────────────────
log "Initializing git submodules..."
cd "$DOTFILES_DIR"
git submodule update --init --recursive

# ── Step 5: Stow ─────────────────────────────────────────────────────────────
log "Symlinking dotfiles with stow..."
stow --target="$HOME" --dir="$DOTFILES_DIR" . --adopt 2>/dev/null || \
  stow --target="$HOME" --dir="$DOTFILES_DIR" .

log "Done! Open a new shell to load everything."
