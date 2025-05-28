# Use Alpine as the base image
FROM alpine:latest

# Set working directory
WORKDIR /root

# Install required packages
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
    wl-clipboard

# Clone NvChad (choose one)
# Option 1: Base NvChad starter config
# RUN git clone https://github.com/NvChad/starter /root/.config/nvim

# Option 2: Pre-configured version of NvChad
RUN git clone https://github.com/ProgrammingRainbow/NvChad-2.5 /root/.config/nvim && \
    rm -rf /root/.config/nvim/.git /root/.config/nvim/*.png && \
    sed -i 's/opt.tabstop = 2/opt.tabstop = 4/' /root/.config/nvim/lua/options.lua && \
    sed -i 's/opt.shiftwidth = 2/opt.shiftwidth = 4/' /root/.config/nvim/lua/options.lua

# Set Neovim as the default entry point
ENTRYPOINT ["nvim"]

