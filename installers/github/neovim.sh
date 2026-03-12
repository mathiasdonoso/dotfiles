# neovim —  Vim-fork focused on extensibility and usability (configured in .gitconfig)
# Update VERSION to the latest release from: https://github.com/neovim/neovim/releases
BINARY="nvim"
VERSION="0.11.6"
ASSET="nvim-linux-x86_64"

install_if_missing() {
  command -v "$BINARY" &>/dev/null && return 0

  echo "  → installing nvim ${VERSION}..."
  local url="https://github.com/neovim/neovim/releases/download/${VERSION}/${ASSET}.tar.gz"
  curl -sL "$url" | tar -xz -C "$WORK_DIR"
  cp "$WORK_DIR/${ASSET}/nvim" "$LOCAL_BIN/nvim"
  chmod +x "$LOCAL_BIN/nvim"
}
