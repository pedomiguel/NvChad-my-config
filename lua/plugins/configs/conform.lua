require("conform").setup {
  formatters_by_ft = {
    python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
    lua = { "stylua" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    go = { "gofmt" },
    javascript = { "eslint" },
    typescript = { "eslint" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
