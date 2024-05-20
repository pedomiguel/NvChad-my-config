--@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'rosepine',
  transparency = false,

  statusline = {
    theme = "minimal",
    order = nil,
    modules = nil,
  },

  tabufline = {
    enabled = false,
    lazyload = false
  },

  nvdash = {
    load_on_startup = true,
    buttons = {
      { "  Focus Nvimtree", "Spc e  ", "NvimTreeFocus" },
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
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
