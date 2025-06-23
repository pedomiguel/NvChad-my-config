local miniai = require 'mini.ai'

require("mini.ai").setup({
 custom_textobjects = {
    o = miniai.gen_spec.treesitter({
      a = { "@block.outer", "@conditional.outer", "@loop.outer" },
      i = { "@block.inner", "@conditional.inner", "@loop.inner" },
    }, {}),
    f = miniai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
    c = miniai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
    r = miniai.gen_spec.treesitter({ a = "@loop.outer", i = "@loop.inner" }, {}),
    x = miniai.gen_spec.treesitter({ a = "@conditional.outer", i = "@conditional.inner" }, {}),
  },
  n_lines = 40,
})
