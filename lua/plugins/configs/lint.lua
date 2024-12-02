local lint = require("lint")

lint.linters_by_ft = {
  python = { "mypy" },
}

local mypy = lint.linters.mypy
mypy.args = {
  '--strict',
  '--show-column-numbers',
  '--show-error-end',
  '--no-site-packages',
  '--ignore-missing-imports',
  '--no-color-output',
  '--python-executable',
  function()
    return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python3'
  end
}
