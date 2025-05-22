local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local nvlsp = require("nvchad.configs.lspconfig")

mason_lspconfig.setup {
  ensure_installed = {
    "pyright", "ruff_lsp", "dockerls", "yamlls", "html", "cssls", "tsserver", "jsonls"
  },
}

mason_lspconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  end,
  ["ruff_lsp"] = function()
    lspconfig.ruff_lsp.setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
      init_options = {
        settings = {
          -- ruff settings go here
        }
      }
    }
  end,
}
