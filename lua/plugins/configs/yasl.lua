require("yasl").setup({
  enable_icons = true,
  transparent = false,
  components = {
    "mode",
    " ",
    {
      events = { "BufEnter", "BufWritePost", "TextChanged", "BufModifiedSet" },
      update = function ()
        return vim.bo.modified and '󱇧' or ''
      end
    },
    " ",
    "%<%t%h%r%w", -- filename
    " ",
    "branch",
    " ",
    "gitdiff",
    "%=",
    "diagnostics",
    " ",
    "filetype",
    " ",
    "%-8.(%l:%L;%c%V%) %P", -- location, and progress
    " ",
  },
})
