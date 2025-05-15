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

   -- LSP and Python/Django support
  { "neovim/nvim-lspconfig" }, -- LSP support
  { "williamboman/mason.nvim" }, -- Manage LSP servers, linters, and formatters
  { "williamboman/mason-lspconfig.nvim" }, -- Bridge Mason and LSPConfig
  { "jose-elias-alvarez/null-ls.nvim" }, -- Formatters and linters
  { "mfussenegger/nvim-dap" }, -- Debugging tools

  -- Python-specific plugins
  { "Vimjas/vim-python-pep8-indent" }, -- PEP8 indentation for Python
  { "tmhedberg/SimpylFold" }, -- Python code folding

  -- Docker and YAML support
  { "ekalinin/Dockerfile.vim" }, -- Dockerfile syntax highlighting
  { "cuducos/yaml.nvim" }, -- YAML enhancements

  -- Treesitter for syntax highlighting
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },

  -- Telescope for enhanced fuzzy searching
  { "nvim-telescope/telescope.nvim", dependencies = "nvim-lua/plenary.nvim" },

  -- Snippet support
  { "L3MON4D3/LuaSnip" }, -- Snippet engine
  { "saadparwaiz1/cmp_luasnip" }, -- Snippet completions
  { "hrsh7th/nvim-cmp" }, -- Autocompletion
  { "hrsh7th/cmp-nvim-lsp" }, -- LSP completions

  -- Additional utilities
  { "folke/trouble.nvim" }, -- Better diagnostics UI
  { "mfussenegger/nvim-dap-python" }, -- Python debugging with DAP
}
