--@type ChadrcConfig
local M = {}

M.ui = {
  theme = "tokyodark",
  transparency = false,
  hl_override = {
    CursorLine = { bg = "#202132" }, -- #202132/#2a2a2a/#3b4261
  },

  cmp = {
    style = "flat_dark", -- default/flat_light/flat_dark/atom/atom_colored
    selected_item_bg = "simple", -- colored / simple
  },

  tabufline = {
    enabled = false,
  },

  telescope = { style = "bordered" }, -- borderless / bordered

  nvdash = {
    load_on_startup = true,
    header = {
      "   ▄▄         ▄ ▄▄▄▄▄▄▄ ",
      " ▄▀███▄     ▄██ █████▀  ",
      " ██▄▀███▄   ███         ",
      " ███  ▀███▄ ███         ",
      " ███    ▀██ ███         ",
      " ███      ▀ ███         ",
      " ▀██ █████▄▀█▀▄██████▄  ",
      "   ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀ ",
    },
    buttons = {
      { " File Browser", "Spc f t", "Telescope file_browser" },
      { " Find File", "Spc f f", "Telescope find_files" },
      { "󰈚 Recent Files", "Spc f o", "Telescope oldfiles" },
      { " Git Status", "Spc g t", "Telescope git_status" },
      { "󰈭 Find Word", "Spc f w", "Telescope live_grep_args" },
      { " Bookmarks", "Spc m a", "Telescope marks" },
      { " Themes", "Spc t h", "Telescope themes" },
      { " Mappings", "Spc c h", "NvCheatsheet" },
      { " Session", "Cmd Line", "source Session.vim" },
      { "󰒲 Lazy", "Cmd Line", "Lazy" },
      { "󰣪 Mason", "Cmd Line", "Mason" },
      { "󰿅 Exit", "Cmd Line", "Q" },
    },
  }
}

return M
