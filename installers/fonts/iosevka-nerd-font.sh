# Iosevka Font — used by alacritty (see .config/alacritty/alacritty.toml)
# Update VERSION to the latest release from: https://github.com/be5invis/Iosevka/releases
FONT_NAME="Iosevka"
VERSION="34.2.1"
FONTS_DIR="$HOME/.local/share/fonts"

install_if_missing() {
  fc-list | grep -qi "$FONT_NAME" && return 0

  echo "  → installing $FONT_NAME Nerd Font ${VERSION}..."
  local url="https://github.com/be5invis/Iosevka/releases/download/v${VERSION}/${FONT_NAME}.tar.xz"
  mkdir -p "$FONTS_DIR/$FONT_NAME"
  curl -sL "$url" | tar -xJ -C "$FONTS_DIR/$FONT_NAME"
  fc-cache -f "$FONTS_DIR/$FONT_NAME"
}
