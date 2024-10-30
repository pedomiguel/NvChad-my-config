--@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'catppuccin',
  transparency = false,

  hl_override = {
    CursorLine = {
      bg = "#1f152d",
    },
    Visual = {
      bg = "#3a2d5a",
    },
  },

  statusline = {
    enabled = false,
    theme = "minimal",
    separator_style = "block",
  },

  tabufline = {
    enabled = false,
  },

  telescope = { style = "bordered" }, -- borderless / bordered

  nvdash = {
    load_on_startup = true,
    buttons = {
      { " Nvimtree", "Spc e  ", "NvimTreeToggle" },
      { " Find File", "Spc f f", "Telescope find_files" },
      { "󰈚 Recent Files", "Spc f o", "Telescope oldfiles" },
      { " Git Status", "Spc g t", "Telescope git_status" },
      { "󰈭 Find Word", "Spc f w", "Telescope live_grep_args" },
      { " Bookmarks", "Spc m a", "Telescope marks" },
      { " Themes", "Spc t h", "Telescope themes" },
      { " Mappings", "Spc c h", "NvCheatsheet" },
      { "󰒲 Lazy", "Command Line", "Lazy" },
      { "󰣪 Mason", "Command Line", "Mason" },
      { "󰿅 Exit", "Command Line", "qa!"},
    },
  },
}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
