-- init.lua
local toggler = require('nvim-toggler')

toggler.setup({
  -- your own inverses
  inverses = {
    ['vim'] = 'emacs',
    ['True'] = 'False',
    ['1'] = '0',
    ['on'] = 'off',
  },
  -- removes the default <leader>i keymap
  remove_default_keybinds = false,
  -- removes the default set of inverses
  remove_default_inverses = false,
  -- auto-selects the longest match when there are multiple matches
  autoselect_longest_match = false
})
