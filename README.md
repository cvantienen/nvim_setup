
# Neovim Chad Configuration

This is a custom Neovim configuration built using the [NvChad](https://github.com/NvChad/NvChad) framework.

## Prerequisites

Make sure you have the following dependencies installed:

1. **Neovim**
   Install Neovim **version 0.10.0 or above**.
   [Download Neovim v0.10.0](https://github.com/neovim/neovim/releases/tag/v0.10.0)

2. **Copilot for Neovim**
   Install GitHub Copilot for Neovim.
   [Installation Guide](https://github.com/github/copilot.vim)

3. **Node.js**
   Required by various plugins.

4. **Nerd Fonts**
   Required for proper icon rendering.
   [Download Nerd Fonts](https://www.nerdfonts.com/)

5. **Ripgrep**
   Used for searching files.

## Setup Instructions

All that is needed is to clone repo and Run:

   ```
   chmod +x setup.sh && ./setup.sh
   ```

1. Wait for `lazy.nvim` to finish downloading and syncing plugins.
2. Run the following command inside Neovim to install required tools:

   ```
   :MasonInstallAll
   ```
3. Delete the `.git` folder from the `nvim` config directory:

   ```bash
   rm -rf ~/.config/nvim/.git
   ```
4. Learn about UI and Base46 customization by running:

   ```
   :h nvui
   ```
