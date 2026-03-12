# delta — diff pager used by git (configured in .gitconfig)
# Update VERSION to the latest release from: https://github.com/dandavison/delta/releases
BINARY="delta"
VERSION="0.18.2"
ASSET="delta-${VERSION}-x86_64-unknown-linux-musl"

install_if_missing() {
  command -v "$BINARY" &>/dev/null && return 0

  echo "  → installing delta ${VERSION}..."
  local url="https://github.com/dandavison/delta/releases/download/${VERSION}/${ASSET}.tar.gz"
  curl -sL "$url" | tar -xz -C "$WORK_DIR"
  cp "$WORK_DIR/${ASSET}/delta" "$LOCAL_BIN/delta"
  chmod +x "$LOCAL_BIN/delta"
}
