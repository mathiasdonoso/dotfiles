# nvm — Node Version Manager
# Update VERSION to the latest release from: https://github.com/nvm-sh/nvm/releases
NVM_VERSION="0.40.1"

install_if_missing() {
  [ -s "$HOME/.nvm/nvm.sh" ] && return 0

  echo "  → installing nvm ${NVM_VERSION}..."
  curl -sL "https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh" | bash
}
