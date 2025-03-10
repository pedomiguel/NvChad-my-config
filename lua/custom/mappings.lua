local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "Window Left"},
    ["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "Window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "Window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "Window up" },
  }
}

M.leap = {
  n = {
    ["s"] = { "<Plug>(leap-forward)", "Leap forward" },
    ["S"] = { "<Plug>(leap-backward)", "Leap backward" },
    ["gs"] = { "<Plug>(leap-from-window)", "Leap from window" },
  },
  o = {
    ["s"] = { "<Plug>(leap-forward)", "Leap forward" },
    ["S"] = { "<Plug>(leap-backward)", "Leap backward" },
    ["gs"] = { "<Plug>(leap-from-window)", "Leap from window" },
  },
}

M.tagbar = {
  n = {
    ["<leader>tt"] = { "<cmd> TagbarToggle <CR>", "Toggle Tagbar" },
  }
}

return M
