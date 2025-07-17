local base = require("plugins.configs.lspconfig")

local lsp = base.lsp
local util = require "lspconfig/util"

local servers = {
  clangd = {
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  },
  ruff = {
    filetypes = { "python" },
  },
  pyright = {
    filetypes = { "python" },
    pyright = { disableOrganizeImports = true, },
    python = {
      analysis = { ignore = { '*' }, },
    },
  },
  ts_ls = {},
  vhdl_ls = {},
  gopls = {
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    cmd = { "gopls" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        staticcheck = true,
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
          unreachable = true,
          nilness = true,
          shadow = true,
        },
        hints = {
          rangeVariableTypes = true,
          parameterNames = true,
          functionTypeParameters = true,
        },
      },
    },
  },
  java_language_server = {
    cmd = { "java-language-server" },
    filetypes = { "java" },
    root_dir = util.root_pattern(".git", "build.gradle", "pom.xml"),
  },
}

for server, settings in pairs(servers) do
  lsp.config(server, { settings = settings, })
  lsp.enable(server)
end
