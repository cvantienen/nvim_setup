# Base python image
FROM python:3.12-alpine

WORKDIR /root

# Install dependencies and Node.js (latest LTS) using NodeSource
RUN apk add --no-cache git nodejs neovim neovim-doc ripgrep build-base curl \
    stylua \
    py3-lsp-server py3-isort black \
    github-cli \
    --update

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

# Install Neovim plugins and treesitter parsers (ignore compilation errors)
RUN nvim --headless +"Lazy! sync" +"Lazy! load nvim-treesitter" \
    +"TSInstallSync! vim lua vimdoc markdown json yaml toml html css javascript typescript python" \
    +qa!


CMD ["nvim"]

