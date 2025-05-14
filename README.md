# 📦 Neovim Chad Configuration

This is a **custom Neovim configuration** built on the powerful [NvChad](https://github.com/NvChad/NvChad) framework. Enhance your Neovim experience with a modern, extensible, and highly customizable setup.

---

## 🚀 Prerequisites

Before you get started, ensure the following dependencies are installed on your system:

1. **Neovim**  
   - Install **version 0.10.0 or above**.  
   - [Download Neovim v0.10.0](https://github.com/neovim/neovim/releases/tag/v0.10.0)

2. **GitHub Copilot for Neovim**  
   - Install GitHub Copilot for Neovim.  
   - [Installation Guide](https://github.com/github/copilot.vim)

3. **Node.js**  
   - Required by various plugins.

4. **Nerd Fonts**  
   - Ensures proper rendering of icons and symbols.  
   - [Download Nerd Fonts](https://www.nerdfonts.com/)

5. **Ripgrep**  
   - Needed for efficient file searching.

---

## 🛠️ Setup Instructions

Set up your custom Neovim configuration in just a few steps:

1. Clone the repository and run the setup script:
   ```bash
   chmod +x setup.sh && ./setup.sh
   ```

2. Wait for `lazy.nvim` to finish downloading and syncing plugins.

3. Launch Neovim and install the required tools:
   ```vim
   :MasonInstallAll
   ```

4. Clean up by removing the `.git` folder from the Neovim configuration directory:
   ```bash
   rm -rf ~/.config/nvim/.git
   ```

5. Learn about UI and `Base46` customization:
   ```vim
   :h nvui
   ```

---

## 🐳 Running Inside a Docker Container

## Mount Multiple Directories
To include additional configuration files:
```bash
docker run -it -v /path/to/your/repo:/workspace -v /path/to/another/dir:/another-dir my-nvim-config
```

### Persist NVChad Configuration
To save your NVChad settings:
```bash
docker run -it -v ~/.config/nvim:/root/.config/nvim -v /path/to/your/repo:/workspace my-nvim-config
```

> **Note:** Ensure the paths you mount are accessible by Docker. On Windows, verify shared paths in Docker Desktop under `Settings > Resources > File Sharing`.

---

## 📚 Additional Resources

- [NvChad Documentation](https://nvchad.github.io/)
- [Neovim Official Documentation](https://neovim.io/doc/)
- [GitHub Copilot for Neovim](https://github.com/github/copilot.vim)

---

Let me know if you’d like any further refinements!
