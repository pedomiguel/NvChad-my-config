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
        diagnosticMode = "workspace",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,

        typeCheckingMode = "standard",
        diagnosticSeverityOverrides = {
          reportMissingImports = "warning",
          reportUnusedVariable = false,
          reportUnusedImport = false,
          reportUnknownParameterType = true,
          reportImportCycles = true,
        },
      },
    },
  },
  filetypes = { "python" },
}

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig['vhdl_ls'].setup({
  on_attach = on_attach,
  capabilities = capabilities
})
