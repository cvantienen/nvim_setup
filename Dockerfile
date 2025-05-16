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
        cmake \
        pkg-config \
        gettext \
        unzip \
        sox \
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

RUN pip install --upgrade pip && \
    pip install pynvim

# Copy and install dev requirements
COPY dev_requirements.txt /root/dev_requirements.txt
RUN pip install --upgrade pip && \
    pip install -r /root/dev_requirements.txt

RUN npm install -g neovim

RUN curl -LO https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.appimage && \
    chmod u+x nvim-linux-x86_64.appimage && \
    ./nvim-linux-x86_64.appimage --appimage-extract && \
    mv squashfs-root /nvim && \
    ln -sf /nvim/AppRun /usr/bin/nvim && \
    rm nvim-linux-x86_64.appimage

RUN git clone https://github.com/cvantienen/nvim_setup.git 

# Copy the .config folder from the repo into /root/.config
RUN cp -r /root/nvim_setup/.config /root/.config

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
    
COPY .config /root/.config

COPY version.sh /version.sh
RUN chmod +x /version.sh
ENTRYPOINT ["/version.sh"]

CMD ["nvim"]

