--@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'rosepine',
  transparency = false,

  statusline = {
    enabled = false,
    theme = "minimal",
    separator_style = "block",
  },

  tabufline = {
    enabled = false,
  },

  nvdash = {
    load_on_startup = true,
    buttons = {
      { "  Nvimtree", "Spc e  ", "NvimTreeToggle" },
      { "  Find File", "Spc f f", "Telescope find_files hidden=true" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "  Git Status", "Spc g t", "Telescope git_status" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
