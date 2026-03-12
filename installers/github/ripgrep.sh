# ripgrep — fast grep replacement (used by vim + aliases)
# Update VERSION to the latest release from: https://github.com/BurntSushi/ripgrep/releases
BINARY="rg"
VERSION="14.1.1"
ASSET="ripgrep-${VERSION}-x86_64-unknown-linux-musl"

install_if_missing() {
  command -v "$BINARY" &>/dev/null && return 0

  echo "  → installing ripgrep ${VERSION}..."
  local url="https://github.com/BurntSushi/ripgrep/releases/download/${VERSION}/${ASSET}.tar.gz"
  curl -sL "$url" | tar -xz -C "$WORK_DIR"
  cp "$WORK_DIR/${ASSET}/rg" "$LOCAL_BIN/rg"
  chmod +x "$LOCAL_BIN/rg"
}
