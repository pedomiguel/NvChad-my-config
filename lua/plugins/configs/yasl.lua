require("yasl").setup({
  enable_icons = true,
  transparent = true,
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
    {
      events = { "BufEnter" },
      update = function()
        local linters = require("lint").get_running()
        if #linters == 0 then
          return "󰦕"
        end
        return "󱉶 " .. table.concat(linters, ", ")
      end
    },
    " ",
    "%-8.(%l:%c%V%) %P", -- location, and progress
    " ",
  },
})
