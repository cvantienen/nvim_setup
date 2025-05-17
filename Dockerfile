# Base python image
FROM python:3.12-slim

WORKDIR /root

ENV TERM=xterm-256color \
    DEBIAN_FRONTEND=noninteractive

# Install dependencies and Node.js (latest LTS) using NodeSource
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        git \
        build-essential \
        libtool \
        autoconf \
        automake \
        ripgrep \
        cmake \
        pkg-config \
        gettext \
        unzip \
        sox \
        fontconfig \
        libsox-fmt-mp3 \
        libncurses5-dev \
        libncursesw5-dev \
        libffi-dev \
        libssl-dev \
        liblzma-dev \
        libbz2-dev && \
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y --no-install-recommends nodejs fuse && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and install the latest FiraCode Nerd Font
# Download and install a single Nerd Font (DroidSansMNerdFont-Regular.otf)
RUN mkdir -p ~/.local/share/fonts && \
    cd ~/.local/share/fonts && \
    curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/Regular/DroidSansMNerdFont-Regular.otf && \
    fc-cache -fv

RUN curl -LO https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.appimage && \
    chmod u+x nvim-linux-x86_64.appimage && \
    ./nvim-linux-x86_64.appimage --appimage-extract && \
    mv squashfs-root /nvim && \
    ln -sf /nvim/AppRun /usr/bin/nvim && \
    rm nvim-linux-x86_64.appimage 

# Copy and install dev requirements
COPY dev_requirements.txt /root/dev_requirements.txt

RUN pip install --upgrade pip && \
    pip install -r /root/dev_requirements.txt

RUN git clone --depth=1 https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim

RUN git clone https://github.com/cvantienen/nvim_setup.git 

# Copy individual config files and folders
RUN cp /root/nvim_setup/nvim/init.lua /root/.config/nvim/ && \
    cp /root/nvim_setup/nvim/lazy-lock.json /root/.config/nvim/ && \
    cp /root/nvim_setup/nvim/LICENSE /root/.config/nvim/ && \
    cp /root/nvim_setup/nvim/README.md /root/.config/nvim/ && \
    cp -r /root/nvim_setup/nvim/lua /root/.config/nvim/ && \
    cp -r /root/nvim_setup/nvim/pack /root/.config/nvim/
 
# Run Lazy.nvim sync and wait for plugin install to complete
RUN nvim --headless \
    "+Lazy! sync" \
    "+lua require('lazy').sync()" \
    "+sleep 5" \
    "+qa"

# Run MasonInstallAll and wait for it to finish
RUN nvim --headless \
    "+lua require('mason-tool-installer').install()" \
    "+sleep 5" \
    "+qa"

# Install Treesitter parsers
RUN nvim --headless \
    "+lua require('nvim-treesitter.install').update({ with_sync = true })" \
    "+sleep 5" \
    "+qa"

CMD ["nvim"]

