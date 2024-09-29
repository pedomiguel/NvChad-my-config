local lint = require("lint")

lint.linters_by_ft = {
  python = { "mypy", },
}

local mypy = lint.linters.mypy
mypy.args = {
  '--strict',
  '--show-column-numbers',
  '--show-error-end',
  '--no-site-packages',
  '--ignore-missing-imports',
  '--hide-error-codes',
  '--hide-error-context',
  '--no-color-output',
  '--no-error-summary',
  '--no-pretty',
  '--python-executable',
  function()
    return vim.fn.exepath 'python3' or vim.fn.exepath 'python'
  end
}
