local lint = require("lint")
local parser = require('lint.parser')

lint.linters_by_ft = {
  python = { "mypy", },
}

-- mypy
lint.linters.mypy = {
  cmd = 'mypy',  -- mypy command
  stdin = false, -- mypy doesn't support stdin
  args = { '--show-column-numbers', '--strict', },
  stream = 'stdout',
  ignore_exitcode = true,
  parser = parser.from_errorformat('%f:%l:%c: %t%n%m', {source = 'mypy'}),
}
