# Alacritty — GPU-accelerated terminal emulator
# Installed via cargo (upstream provides no pre-built binaries)
# Build deps (freetype, fontconfig, xcb, xkbcommon) must be present — see installers/packages/debian.txt
install_if_missing() {
  command -v alacritty &>/dev/null && return 0

  echo "  → installing alacritty via cargo..."

  # Source cargo env in case Rust was installed earlier in this same run
  # shellcheck source=/dev/null
  [ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

  cargo install alacritty
}
