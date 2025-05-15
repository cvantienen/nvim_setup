local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local null_ls = require("null-ls")

-- Initialize Mason
mason.setup()
mason_lspconfig.setup({
  ensure_installed = {
    "pyright", -- Python LSP
    "dockerls", -- Docker LSP
    "yamlls", -- YAML LSP
    "html", -- HTML LSP
  },
})

-- Diagnostic Signs
vim.fn.sign_define("DiagnosticSignError", { text = "✘", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "▲", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "ℹ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "➤", texthl = "DiagnosticSignHint" })

-- LSP Servers
lspconfig.pyright.setup({
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict", -- Enable strict type checking
      },
    },
  },
})
lspconfig.dockerls.setup({})
lspconfig.yamlls.setup({
  settings = {
    yaml = {
      schemas = {
        kubernetes = "*.yaml", -- Apply Kubernetes schema for YAML files
      },
    },
  },
})
lspconfig.html.setup({}) -- HTML LSP for auto-completion, diagnostics, etc.

-- Null-LS for Formatters and Linters
null_ls.setup({
  sources = {
    -- Python
    null_ls.builtins.formatting.black, -- Python formatter
    null_ls.builtins.diagnostics.flake8, -- Python linter

    -- HTML
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "html" }, -- Enable Prettier for HTML
    }),

    -- Django (via djlint)
    null_ls.builtins.formatting.djlint, -- Django template formatter
    null_ls.builtins.diagnostics.djlint, -- Django template linter

    -- YAML
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "yaml", "yml" }, -- Enable Prettier for YAML
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatting", {}),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})

