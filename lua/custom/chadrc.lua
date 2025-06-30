--@type ChadrcConfig
local M = {}

-- Colors references
-- gruvbox = {
--   cursor_line_bg = "#3c2826",
--   visual_bg = "#504945",
--   status_line_bg = "#32302f",
-- },
-- tokyonight = {
--   cursor_line_bg = "#2a2f4a",
--   visual_bg = "#3b4261",
--   status_line_bg = "#1f2335",
-- },
-- tokyodark = {
--   cursor_line_bg = "#3a3d4d",
--   visual_bg = "#51576d",
--   status_line_bg = "#292c3c",
-- },
-- tokyodark = {
--   cursor_line_bg = "#2c2e3e",
--   visual_bg = "#414458",
--   status_line_bg = "#1a1b26",
-- },

M.ui = {
  theme = "tokyodark",
  transparency = false,
  hl_override = {
    CursorLine = { bg = "#2c2e3e" },
    Visual = { bg = "#414458" },
    StatusLine = { bg = "#1a1b26" },
  },

  statusline = {
    enabled = false,
    theme = "minimal",
    separator_style = "block",
  },

  cmp = {
    style = "atom", -- default/flat_light/flat_dark/atom/atom_colored
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
      { "󰒲 Lazy", "Command Line", "Lazy" },
      { "󰣪 Mason", "Command Line", "Mason" },
      { "󰿅 Exit", "Command Line", "Q" },
    },
  }
}

return M
