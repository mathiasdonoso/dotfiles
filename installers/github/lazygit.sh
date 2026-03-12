# lazygit — terminal UI for git (aliased as 'lg')
# Update VERSION to the latest release from: https://github.com/jesseduffield/lazygit/releases
BINARY="lazygit"
VERSION="0.44.1"
ASSET="lazygit_${VERSION}_Linux_x86_64"

install_if_missing() {
  command -v "$BINARY" &>/dev/null && return 0

  echo "  → installing lazygit ${VERSION}..."
  local url="https://github.com/jesseduffield/lazygit/releases/download/v${VERSION}/${ASSET}.tar.gz"
  curl -sL "$url" | tar -xz -C "$WORK_DIR"
  cp "$WORK_DIR/lazygit" "$LOCAL_BIN/lazygit"
  chmod +x "$LOCAL_BIN/lazygit"
}
