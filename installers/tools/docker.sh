# docker — container runtime
# Installs Docker Engine via the official repository (not the distro's package).
# Adds the current user to the 'docker' group (re-login required to take effect).

install_if_missing() {
  command -v docker &>/dev/null && return 0

  echo "  → installing docker..."

  case "$DISTRO" in
    ubuntu|debian|pop|linuxmint)
      # Add Docker's official GPG key and repository, then install
      sudo apt-get install -y ca-certificates curl
      sudo install -m 0755 -d /etc/apt/keyrings
      sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
        -o /etc/apt/keyrings/docker.asc
      sudo chmod a+r /etc/apt/keyrings/docker.asc

      echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" \
        | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

      sudo apt-get update
      sudo apt-get install -y \
        docker-ce docker-ce-cli containerd.io \
        docker-buildx-plugin docker-compose-plugin
      ;;

    fedora)
      sudo dnf install -y dnf-plugins-core
      sudo dnf config-manager --add-repo \
        https://download.docker.com/linux/fedora/docker-ce.repo
      sudo dnf install -y \
        docker-ce docker-ce-cli containerd.io \
        docker-buildx-plugin docker-compose-plugin
      ;;
  esac

  # Enable and start the service
  sudo systemctl enable --now docker

  # Allow running docker without sudo (re-login required)
  sudo usermod -aG docker "$USER"
  echo "  → added $USER to 'docker' group — re-login to run docker without sudo"
}
