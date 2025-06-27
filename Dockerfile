# Use Alpine as the base image
FROM alpine:latest

# Set working directory
WORKDIR /root

# Install required packages, including python3 and py3-pip
RUN apk update && apk add --no-cache \
    git \
    nodejs \
    neovim \
    ripgrep \
    build-base \
    wget \
    curl \
    unzip \
    xclip \
    wl-clipboard \
    python3 \
    py3-pip \
    py3-virtualenv

# Clone pre-configured NvChad config
RUN git clone https://github.com/ProgrammingRainbow/NvChad-2.5 /root/.config/nvim && \
    rm -rf /root/.config/nvim/.git /root/.config/nvim/*.png && \
    sed -i 's/opt.tabstop = 2/opt.tabstop = 4/' /root/.config/nvim/lua/options.lua && \
    sed -i 's/opt.shiftwidth = 2/opt.shiftwidth = 4/' /root/.config/nvim/lua/options.lua

# Copy your requirements file into the container (make sure to add this file next to your Dockerfile)
COPY requirements.txt /root/requirements.txt

# Setup python venv and install dependencies
RUN python3 -m virtualenv /root/workspace_venv && \
    /root/workspace_venv/bin/pip install --upgrade pip && \
    /root/workspace_venv/bin/pip install -r /root/requirements.txt

# Activate venv and start nvim
ENTRYPOINT ["/bin/sh", "-c", "source /root/workspace_venv/bin/activate && exec nvim"]


