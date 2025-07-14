local base = require("plugins.configs.lspconfig")

local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")
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
    root_dir = util.root_pattern("pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git"),
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          diagnosticSeverityOverrides = {
            reportDuplicateImport = "warning",
            reportImportCycles = "error",
            reportMissingImports = "error",
            reportMissingTypeArgument = "warning",
            reportPossiblyUnboundVariable = "warning",
            reportReturnType = "warning",
            reportUnknownParameterType = "warning",
            reportUnusedImport = "none",
            reportUnusedVariable = "none"
          },
          typeCheckingMode = "standard",
          useLibraryCodeForTypes = true
        }
      }
    }
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

for name, config in pairs(servers) do
  config.on_attach = on_attach
  config.capabilities = capabilities
  lspconfig[name].setup(config)
end
