local g = vim.g


g.tagbar_width = math.max(30, vim.api.nvim_win_get_width(0) / 5)
g.tagbar_show_tag_linenumbers = true
g.tagbar_no_status_line = true
g.tagbar_autofocus = true
g.tagbar_wrap = false
g.tagbar_sort = false
g.tagbar_iconchars = {'', ''}
g.tagbar_map_togglepause = ''
g.tagbar_map_preview = "<Tab>"
vim.api.nvim_set_hl(0, "TagbarHighlight", {bg = "NvimDarkGrey3"})
