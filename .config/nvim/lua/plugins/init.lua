return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre',
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
    end
  },

  -- LSP and Python/Django support
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "mfussenegger/nvim-dap" },

  -- Python-specific plugins
  { "Vimjas/vim-python-pep8-indent" },
  { "tmhedberg/SimpylFold" },

  -- Docker and YAML support
  { "ekalinin/Dockerfile.vim" },
  { "cuducos/yaml.nvim" },

  -- Treesitter for syntax highlighting
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },

  -- Telescope for enhanced fuzzy searching
  { "nvim-telescope/telescope.nvim", dependencies = "nvim-lua/plenary.nvim" },

  -- Snippet support
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },

  -- Additional utilities
  { "folke/trouble.nvim" },
  { "mfussenegger/nvim-dap-python" },

  {
    "robitx/gp.nvim",
    config = function()
      local conf = {
        providers = {
          copilot = {
            disable = false,
            endpoint = "https://api.githubcopilot.com/chat/completions",
            secret = {
              "bash",
              "-c",
              "cat ~/.config/github-copilot/apps.json | sed -e 's/.*oauth_token...//;s/\".*//'"
            },
          },
          openai = {},
        },
        default_chat_agent = "ChatCopilot",
        default_command_agent = "CodeCopilot",
      }
      require("gp").setup(conf)
      vim.keymap.set({"n", "i"}, "<C-g>c", "<cmd>GpChatNew<cr>", { desc = "New Copilot Chat" })
    end,
  }
}