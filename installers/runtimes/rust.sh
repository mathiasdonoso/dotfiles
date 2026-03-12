# Rust — installed via rustup (manages cargo, rustc, etc.)
install_if_missing() {
  command -v cargo &>/dev/null && return 0

  echo "  → installing Rust via rustup..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
}
