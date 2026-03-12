# Go — installed from official tarball (apt version is typically outdated)
# Update VERSION to the latest release from: https://go.dev/dl/
# Installs to /usr/local/go — already in PATH via .profile
VERSION="1.23.4"
ARCHIVE="go${VERSION}.linux-amd64.tar.gz"

install_if_missing() {
  command -v go &>/dev/null && return 0

  echo "  → installing Go ${VERSION}..."
  curl -sL "https://go.dev/dl/${ARCHIVE}" -o "$WORK_DIR/$ARCHIVE"
  sudo rm -rf /usr/local/go
  sudo tar -C /usr/local -xzf "$WORK_DIR/$ARCHIVE"
}
