return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre',
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
   "williamboman/mason.nvim",
   opts = {
    ensure_installed = {
      "lua-language-server",
      "stylua",
      "html-lsp",
      "css-lsp",
      "prettier",
      "black",
      "ruff",
    },
   },
  },
  
  {
   "nvim-treesitter/nvim-treesitter",
   opts = {
    ensure_installed = {
      lua-language-server",
      "stylua",
      "html-lsp",
      "css-lsp",
      "prettier",
      "black",
      "ruff",
      -- Add these for full Python/webdev/docker/Django:
      "pyright",          -- Python LSP
      "dockerls",         -- Docker LSP
      "yamlls",           -- YAML LSP
      "jsonls",           -- JSON LSP
      "djlint",           -- Django templates linter/formatter
      "eslint-lsp",       -- JS/TS linting
      "tsserver",         -- JS/TS LSP
      "pylint",           -- Python linter
      "flake8",           -- Python linter
      "mypy",             -- Python static typing
      
    },
   },
  },
  
  {
    "github/copilot.vim",
    lazy = false,
    config = function()  -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true;
      vim.g.copilot_assume_mapped = true;
      vim.g.copilot_tab_fallback = "";
    -- The mapping is set to other key, see custom/lua/mappings
    -- or run <leader>ch to see copilot mapping section
    end
  },
    {
    lazy = false,
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },

}
