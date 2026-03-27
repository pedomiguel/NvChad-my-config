return {
  ruff = { filetypes = { "python" } },
  basedpyright = {
    basedpyright = {
      filetypes = { "python" },
      basedpyright = { disableOrganizeImports = true },
      analysis = { ignore = { "*" } },
    },
  },
}
