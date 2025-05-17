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
    luarocks

# Install latest npm version
RUN npm install -g npm@latest

# Install Lua Language Server from edge repo
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ lua-language-server

# Download and install Nerd Fonts Symbols Only
RUN mkdir -p ~/.local/share/fonts && \
    wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/latest/download/NerdFontsSymbolsOnly.zip && \
    unzip ~/.local/share/fonts/NerdFontsSymbolsOnly.zip -d ~/.local/share/fonts/NerdFontsSymbolsOnly && \
    rm ~/.local/share/fonts/NerdFontsSymbolsOnly.zip && \
    fc-cache -fv

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

# Preinstall Neovim plugins, Mason tools, and Treesitter parsers
RUN nvim --headless \
    "+Lazy! sync" \
    "+sleep 5" \
    "+lua require('mason-tool-installer').install()" \
    "+TSInstallSync! vim lua vimdoc markdown json yaml toml html css javascript typescript python" \
    "+sleep 5" \
    "+qa"

CMD ["nvim"]
