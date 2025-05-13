#!/bin/bash

set -e

echo "🟢 Updating package list..."
sudo apt update

echo "📦 Installing required tools..."
sudo apt install -y curl tar unzip fontconfig

# ========== Neovim Installation ==========
echo "⬇️ Downloading Neovim v0.10.0..."
curl -LO https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz

echo "📦 Extracting Neovim..."
tar xzvf nvim-linux64.tar.gz

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

echo "🎉 All done! You can now launch Neovim with 'nvim'"
