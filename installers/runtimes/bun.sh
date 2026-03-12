# Bun — JavaScript runtime / package manager
install_if_missing() {
  command -v bun &>/dev/null && return 0

  echo "  → installing Bun..."
  curl -fsSL https://bun.sh/install | bash
}
