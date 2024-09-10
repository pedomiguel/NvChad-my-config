local opt = vim.opt
local g = vim.g
local config = require("core.utils").load_config()

-------------------------------------- globals -----------------------------------------
g.nvchad_theme = config.ui.theme
g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
g.toggle_theme_icon = "   "
g.transparency = config.ui.transparency

-------------------------------------- options ------------------------------------------
opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.wrap = true

opt.cursorline = true
opt.guicursor = "a:block-blinkon100"

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.autoindent = false

opt.fillchars = { eob = "¬" }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = false
opt.numberwidth = 2
opt.ruler = false
opt.relativenumber = true

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

opt.iskeyword:remove("_")

g.mapleader = " "

-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH

local api = vim.api

-------------------------------------- aliases  ------------------------------------------
local alias = api.nvim_command

alias ('command! Q wqa')
alias('command! BufferPath echo expand("%:p")')
alias('command! HighlightAll normal! ggVG')

-------------------------------------- autocmds ------------------------------------------
local autocmd = api.nvim_create_autocmd

autocmd("TextYankPost", {
  pattern = '*',
  callback = function ()
    vim.highlight.on_yank { timeout = 100 }
  end,
  desc = "Highlight yanked text"
})

autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
  end,
  desc = "Trim trailing whitespace on save"
})

autocmd("VimEnter", {
  callback = function(data)
    local directory = vim.fn.isdirectory(data.file) == 1

    if directory then
      vim.cmd.cd(data.file)
      vim.cmd "NvimTreeFocus"
    end
  end,
  desc = "Open NvimTree when in a directory",
})

autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
  pattern = '*',
  callback = function()
    require("lint").try_lint()
  end,
})

autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    local line = vim.fn.line
    if line("'\"") > 0 and line("'\"") <= line("$") then
      vim.cmd('normal! g`"')
    end
  end,
  desc = "Open file at last cursor position"
})

autocmd("FileType", {
  pattern = { "c", "cpp", "cu", "py" },
  callback = function()
    vim.bo.shiftwidth = 4
  end,
  desc = "Set shiftwidth to 4 in clang and python files",
})

autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
  desc = "Dont list quickfix buffers"
})

autocmd("BufWritePost", {
  pattern = vim.tbl_map(function(path)
    return vim.fs.normalize(vim.loop.fs_realpath(path))
  end, vim.fn.glob(vim.fn.stdpath "config" .. "/lua/custom/**/*.lua", true, true, true)),
  group = api.nvim_create_augroup("ReloadNvChad", {}),

  callback = function(opts)
    local fp = vim.fn.fnamemodify(vim.fs.normalize(api.nvim_buf_get_name(opts.buf)), ":r") --[[@as string]]
    local app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim"
    local module = string.gsub(fp, "^.*/" .. app_name .. "/lua/", ""):gsub("/", ".")

    require("plenary.reload").reload_module "base46"
    require("plenary.reload").reload_module(module)
    require("plenary.reload").reload_module "custom.chadrc"

    config = require("core.utils").load_config()

    vim.g.nvchad_theme = config.ui.theme
    vim.g.transparency = config.ui.transparency

    -- statusline
    if config.ui.statusline.enabled then
      require("plenary.reload").reload_module("nvchad.statusline." .. config.ui.statusline.theme)
      vim.opt.statusline = "%!v:lua.require('nvchad.statusline." .. config.ui.statusline.theme .. "').run()"
    end

    -- tabufline
    if config.ui.tabufline.enabled then
      require("plenary.reload").reload_module "nvchad.tabufline.modules"
      vim.opt.tabline = "%!v:lua.require('nvchad.tabufline.modules').run()"
    end

    require("base46").load_all_highlights()
    -- vim.cmd("redraw!")
  end,
  desc = "Reload some chadrc options on-save"
})

-------------------------------------- commands ------------------------------------------
local new_cmd = api.nvim_create_user_command

new_cmd("NvChadUpdate", function()
  require "nvchad.updater"()
end, {})
