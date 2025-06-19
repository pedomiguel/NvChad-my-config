--@type ChadrcConfig
local M = {}

local theme_colors = {
  gruvbox = {
    cursor_line_bg = "#3c2826",
    visual_bg = "#504945",
    status_line_bg = "#32302f",
  },
  tokyonight = {
    cursor_line_bg = "#2a2f4a",
    visual_bg = "#3b4261",
    status_line_bg = "#1f2335",
  },
  catppuccin = {
    cursor_line_bg = "#3a3d4d",
    visual_bg = "#51576d",
    status_line_bg = "#292c3c",
  },
}

M.ui = {
  theme = "tokyonight",
  transparency = false,
}

local colors = theme_colors[M.ui.theme]

M.ui.hl_override = {
  CursorLine = { bg = colors.cursor_line_bg },
  Visual = { bg = colors.visual_bg },
  StatusLine = { bg = colors.status_line_bg },
}

M.ui.statusline = {
  enabled = false,
  theme = "minimal",
  separator_style = "block",
}

M.ui.tabufline = {
  enabled = false,
}

M.ui.telescope = { style = "bordered" } -- borderless / bordered

M.ui.nvdash = {
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

return M
