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

# Download and install the latest Neovim pre-release AppImage
RUN curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.appimage && \
    chmod u+x nvim-linux-x86_64.appimage && \
    ./nvim-linux-x86_64.appimage --appimage-extract && \
    mv squashfs-root /nvim && \
    ln -s /nvim/AppRun /usr/bin/nvim

# Check the version (should show v0.12.0-dev...)
RUN nvim --version

# Clone your Neovim config
RUN git clone https://github.com/cvantienen/nvim_setup.git /nvim_setup

# Copy the personal Neovim configuration into the container
RUN mkdir -p /root/.config/nvim && cp -r /nvim_setup/nvim_copy/* /root/.config/nvim/

# Install Neovim Python dependencies
RUN pip3 install pynvim

# Install Neovim Node.js dependencies
RUN npm install -g neovim

# Set Neovim as the default command
CMD ["nvim"]
