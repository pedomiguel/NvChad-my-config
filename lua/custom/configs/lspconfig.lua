local lsp = require("plugins.configs.lspconfig").lsp

local servers = {
  clangd = { filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }, },
  ruff = { filetypes = { "python" }, },
  pyright = {
    filetypes = { "python" },
    pyright = { disableOrganizeImports = true, },
    python = { analysis = { ignore = { '*' }, }, },
  },
  gopls = {
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    cmd = { "gopls" },
    settings = {
      gopls = {
        staticcheck = true,
        completeUnimported = true,
        usePlaceholders = false,
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
  jdtls = {
    filetypes = { "java" },
    root_markers = { "mvnw", "gradlew", "pom.xml", "build.gradle" },
    cmd = {
      "java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-Xms1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens", "java.base/java.util=ALL-UNNAMED",
      "--add-opens", "java.base/java.lang=ALL-UNNAMED",
      "-javaagent:" .. vim.fn.expand("~/.local/share/nvim/mason/share/jdtls/lombok.jar"),
      "-jar", vim.fn.glob(vim.fn.expand("~/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")),
      "-configuration", vim.fn.expand("~/.local/share/nvim/mason/share/jdtls/config_linux"),
      "-data", vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
    },
  },
}

for server, settings in pairs(servers) do
  lsp.config(server, { settings = settings, })
  lsp.enable(server)
end
