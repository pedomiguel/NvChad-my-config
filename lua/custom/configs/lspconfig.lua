local base = require("plugins.configs.lspconfig")

local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off", -- Leave this function for mypy
        reportUnusedVariable = true,
        reportUnusedImport = true,
        reportImportCycles = true,
      },
    },
  },
  filetypes = { "python" },
}
