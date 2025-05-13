#!/bin/bash

set -e

echo "🟢 Updating package list..."
sudo apt update

echo "📦 Installing dependencies: curl, tar, unzip, fontconfig..."
sudo apt install -y curl tar unzip fontconfig

# ========== Neovim Installation ==========
echo "⬇️ Downloading Neovim v0.10.0..."
curl -LO https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz

echo "📦 Extracting Neovim..."
tar xzvf nvim-linux64.tar.gz

# Ensure that the target directory /opt/nvim is empty
echo "🧹 Cleaning up any previous Neovim files in /opt/nvim..."
sudo rm -rf /opt/nvim

echo "🚚 Moving Neovim to /opt..."
sudo mv nvim-linux64 /opt/nvim

echo "🔗 Creating symlink to /usr/local/bin/nvim..."
sudo ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim

echo "🧹 Cleaning up Neovim tarball..."
rm nvim-linux64.tar.gz

echo "✅ Neovim installed:"
nvim --version | head -n 1

# ========== Nerd Font Installation ==========
FONT_NAME="FiraCode"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip"

echo "⬇️ Downloading ${FONT_NAME} Nerd Font..."
curl -LO "$FONT_URL"

echo "📂 Installing ${FONT_NAME} Nerd Font..."
mkdir -p ~/.local/share/fonts
unzip -o FiraCode.zip -d ~/.local/share/fonts/

echo "🔄 Updating font cache..."
fc-cache -fv

echo "🧹 Cleaning up font zip..."
rm FiraCode.zip

echo "✅ ${FONT_NAME} Nerd Font installed!"

# ========== Install Node.js using nvm ==========
echo "⬇️ Installing Node Version Manager (nvm)..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Load nvm into the current shell session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install the latest Node.js LTS version
echo "⬇️ Installing the latest Node.js version using nvm..."
nvm install node

# Set the installed version as default
nvm alias default node

echo "✅ Node.js installed:"
node -v || echo "⚠️ Node.js version check failed"

echo "✅ npm installed:"
npm -v || echo "⚠️ npm version check failed"

# ========== Ripgrep Installation ==========
echo "⬇️ Installing ripgrep..."
sudo apt install -y ripgrep

echo "✅ ripgrep installed:"
rg --version | head -n 1 || echo "⚠️ ripgrep version check failed"

# ========== Copy Custom Neovim Config ==========
echo "📁 Copying custom Neovim config from /root/nvim_setup/nvim_copy to ~/.config/nvim..."
mkdir -p ~/.config/nvim
cp -r /root/nvim_setup/nvim_copy/* ~/.config/nvim/

echo "✅ Custom Neovim configuration installed!"

echo "🎉 All done! Launch Neovim using: nvim"
