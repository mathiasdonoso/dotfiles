# fd — fast find replacement (used by fzf aliases + vim)
# Update VERSION to the latest release from: https://github.com/sharkdp/fd/releases
BINARY="fd"
VERSION="10.4.2"
ASSET="fd-v${VERSION}-x86_64-unknown-linux-musl"

install_if_missing() {
  command -v "$BINARY" &>/dev/null && return 0

  echo "  → installing fd ${VERSION}..."
  local url="https://github.com/sharkdp/fd/releases/download/v${VERSION}/${ASSET}.tar.gz"
  curl -sL "$url" | tar -xz -C "$WORK_DIR"
  cp "$WORK_DIR/${ASSET}/fd" "$LOCAL_BIN/fd"
  chmod +x "$LOCAL_BIN/fd"
}
