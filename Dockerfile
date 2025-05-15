FROM python:3.12-slim-bookworm

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
        cmake \
        pkg-config \
        gettext \
        unzip \
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

RUN pip install --upgrade pip && \
    pip install pynvim

RUN npm install -g neovim

RUN curl -LO https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.appimage && \
    chmod u+x nvim-linux-x86_64.appimage && \
    ./nvim-linux-x86_64.appimage --appimage-extract && \
    mv squashfs-root /nvim && \
    ln -sf /nvim/AppRun /usr/bin/nvim && \
    rm nvim-linux-x86_64.appimage

RUN git clone https://github.com/cvantienen/nvim_setup.git /root/nvim_setup

RUN mkdir -p /.config && \
    cp -r /root/nvim_setup/.config/. /.config/


RUN echo "== Installed versions ==" && \
    python3 --version && \
    pip --version && \
    node --version && \
    npm --version && \
    nvim --version && \
    git --version && \
    echo "========================"

CMD ["nvim"]

