# Use Ubuntu latest LTS version as the base image
FROM ubuntu:22.04

# Set environment variables to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    neovim \
    ripgrep \
    nodejs \
    npm \
    python3 \
    python3-pip \
    python3-venv \
    unzip \
    && apt-get clean

# Install NVChad
RUN git clone https://github.com/NvChad/NvChad.git ~/.config/nvim --depth 1

# Install Neovim Python dependencies
RUN pip3 install pynvim

# Install Neovim Node.js dependencies
RUN npm install -g neovim

# Set Neovim as the default command
CMD ["nvim"]
