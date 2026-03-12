# uv — Python package / project manager (replaces pip, pyenv, etc.)
install_if_missing() {
  command -v uv &>/dev/null && return 0

  echo "  → installing uv..."
  curl -LsSf https://astral.sh/uv/install.sh | sh
}
