# Base python image
FROM python:3.12-alpine

WORKDIR /root

ENV TERM=xterm-256color \
    DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apk add --no-cache \
    git \
    curl \
    nodejs \
    xclip \
    npm \
    neovim \
    neovim-doc \
    ripgrep \
    unzip \
    build-base \
    fontconfig \
    stylua \
    py3-lsp-server \
    py3-isort \
    black \
    bash \
    github-cli \
    lua5.4 \
    luarocks \ 
    --update

# Install latest npm version
RUN npm install -g npm@latest

# Install Lua Language Server from edge repo
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ lua-language-server

# Install Python packages
COPY dev_requirements.txt /root/dev_requirements.txt
RUN pip install --upgrade pip && \
    pip install -r /root/dev_requirements.txt

# Clone NVChad or user config
RUN git clone https://github.com/cvantienen/nvim_setup.git

# Setup NVChad config
RUN mkdir -p /root/.config/nvim && \
    cp /root/nvim_setup/nvim/init.lua /root/.config/nvim/ && \
    cp /root/nvim_setup/nvim/lazy-lock.json /root/.config/nvim/ && \
    cp /root/nvim_setup/nvim/LICENSE /root/.config/nvim/ && \
    cp /root/nvim_setup/nvim/README.md /root/.config/nvim/ && \
    cp -r /root/nvim_setup/nvim/lua /root/.config/nvim/ && \
    cp -r /root/nvim_setup/nvim/pack /root/.config/nvim/

# Add GitHub Copilot plugin
RUN git clone --depth=1 https://github.com/github/copilot.vim.git \
    /root/.config/nvim/pack/github/start/copilot.vim

RUN apk add --no-cache git fontconfig && \
    git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git /tmp/nerd-fonts && \
    cd /tmp/nerd-fonts && \
    git sparse-checkout init --cone && \
    git sparse-checkout set patched-fonts/IBMPlexMono && \
    chmod +x install.sh && \
    ./install.sh hack && \
    rm -rf /tmp/nerd-fonts && \
    fc-cache -fv

# Preinstall Neovim plugins, Mason tools, and Treesitter parsers
RUN nvim --headless \
    "+Lazy! sync" \
    "+sleep 5" \
    "+lua require('mason-tool-installer').install()" \
    "+TSInstallSync! vim lua vimdoc markdown json yaml toml html css javascript typescript python" \
    "+sleep 5" \
    "+qa"

# Set the default command to run when starting the container

CMD ["nvim"]
