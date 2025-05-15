# Use Alpine Edge as the base image
FROM alpine:edge

# Set the working directory
WORKDIR /root

# Set environment variables to avoid interactive prompts
ENV TERM=xterm-256color \
    DEBIAN_FRONTEND=noninteractive

# Install required dependencies
RUN apk add --no-cache \
    git \
    nodejs \
    npm \
    python3 \
    py3-pip \
    py3-virtualenv \
    curl \
    ripgrep \
    unzip \
    xz && \
    pip3 install --upgrade pip && \
    npm install -g neovim

# Install the latest Neovim pre-release AppImage
RUN curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.appimage && \
    chmod u+x nvim-linux-x86_64.appimage && \
    ./nvim-linux-x86_64.appimage --appimage-extract && \
    mv squashfs-root /nvim && \
    ln -s /nvim/AppRun /usr/bin/nvim

# Clone your custom Neovim config
RUN git clone https://github.com/cvantienen/nvim_setup.git /nvim_setup

# Copy the custom Neovim configuration into the container
RUN mkdir -p /root/.config/nvim && cp -r /nvim_setup/.config/* /root/.config/nvim/

# Install Neovim Python dependencies
RUN pip3 install pynvim

# Set Neovim as the default command
CMD ["nvim"]
