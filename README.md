# 📦 Neovim Chad Configuration

This is a **custom Neovim configuration** built on the powerful [NvChad](https://github.com/NvChad/NvChad) framework. Enhance your Neovim experience with a modern, extensible, and highly customizable setup. 

## 🛠️ Setup Instructions

Set up your custom Neovim configuration just by getting copilot apps.json
copilot with oauth key:

1. Clone the repository and build the setup script:

   ```bash
   docker build -t nvim .
   ```

 Wait for `lazy.nvim` to finish downloading and syncing plugins.

Launch Neovim and install the required tools:

   ```vim
   :MasonInstallAll
   ```

Learn about UI and `Base46` customization:

   ```vim
   :h nvui
   ```

## 🐳 Running Inside a Docker Container

```bash
docker run -it -v "$(pwd):/workspace" nvim         
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
