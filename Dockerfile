# Use Ubuntu latest LTS version as the base image
FROM ubuntu:22.04

# Set environment variables to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    ripgrep \
    nodejs \
    npm \
    python3 \
    python3-pip \
    python3-venv \
    unzip \
    xz-utils \
    && apt-get clean

# Install latest Neovim AppImage and extract it
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && \
    chmod u+x nvim.appimage && \
    ./nvim.appimage --appimage-extract && \
    mv squashfs-root /nvim && \
    ln -s /nvim/AppRun /usr/bin/nvim

# Verify correct version is installed
RUN nvim --version

# Clone your repository containing the personal Neovim config
RUN git clone https://github.com/cvantienen/nvim_setup.git /nvim_setup

# Copy the personal Neovim configuration from the repository
RUN mkdir -p /root/.config/nvim && cp -r /nvim_setup/nvim_copy/* /root/.config/nvim/

# Install Neovim Python dependencies
RUN pip3 install pynvim

# Install Neovim Node.js dependencies
RUN npm install -g neovim

# Set Neovim as the default command
CMD ["nvim"]
