# TPM — Tmux Plugin Manager (referenced in .tmux.conf)
# Cloned to a fixed path, not a binary in PATH
TPM_DIR="$HOME/.tmux/plugins/tpm"

install_if_missing() {
  [ -d "$TPM_DIR" ] && return 0

  echo "  → installing TPM..."
  git clone --depth 1 https://github.com/tmux-plugins/tpm "$TPM_DIR"
}
