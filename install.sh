#!/bin/bash
set -e # Stop on error
set -x # Print every command

sudo apt update
sudo apt upgrade -y

# WSL utilities (e.g. open web browser)
sudo add-apt-repository ppa:wslutilities/wslu -y
sudo apt update
sudo apt install wslu -y

# Misc tools
sudo apt install zip highlight jq net-tools -y

if [ ! -f ~/.zshrc ]; then
    # zsh
    sudo apt install zsh -y
fi
if [ ! -f ~/.oh-my-zsh]; then
    # oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Python
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install python3.11 python3.11-distutils python3.11-venv python-is-python3 -y
curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11

# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# Node (with fnm)
curl -o- https://fnm.vercel.app/install | bash
fnm install 22

# Install pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -
# Ensure local packages are installed under ~/.local/
# https://stackoverflow.com/a/59227497
echo "prefix=~/.local/" > ~/.npmrc

# Docker
sudo apt install -y docker.io docker-compose-v2 
# sudo usermod -aG docker $USER
# newgrp docker
# sudo systemctl restart docker
# docker run hello-world

# AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rdf aws
rm -rdf awscliv2.zip

# Git config
git config --global diff.tool vi
git config --global difftool.prompt false
git config --global advice.addIgnoredFile false

# GitHub CLI
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y))   && sudo mkdir -p -m 755 /etc/apt/keyrings         && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg         && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null   && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg      && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null   && sudo apt update      && sudo apt install gh -y
gh auth login

# Create SSH key
# ssh-keygen -t ed25519 -C "user@email.com"
# ln -s ~/.ssh/id_ed25519 ~/.ssh/id_rsa
# ln -s ~/.ssh/id_ed25519.pub ~/.ssh/id_rsa.pub
# If keys were copied from elsewhere and lost their proper permissions
# chmod 600 ~/.ssh/id_ed25519
# chmod 644 ~/.ssh/id_ed25519.pub
eval $(ssh-agent)
# Test ssh connection to GitHub
ssh -T git@github.com

# Install dependencies for wxWidget-based apps
# See https://github.com/wxWidgets/Phoenix/blob/master/README.rst#prerequisites
# sudo apt install -y \
#     dpkg-dev \
#     build-essential \
#     python3-dev \
#     freeglut3-dev \
#     libgl1-mesa-dev \
#     libglu1-mesa-dev \
#     libgstreamer-plugins-base1.0-dev \
#     libgtk-3-dev \
#     libjpeg-dev \
#     libnotify-dev \
#     libpng-dev \
#     libsdl2-dev \
#     libsm-dev \
#     libtiff-dev \
#     libwebkit2gtk-4.1-dev \
#     libxtst-dev