return {
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
}
