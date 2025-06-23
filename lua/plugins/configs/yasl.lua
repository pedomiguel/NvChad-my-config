require("yasl").setup({
  enable_icons = true,
  transparent = false,
  components = {
    "mode",
    " ",
    {
      events = { "BufEnter", "BufWritePost", "TextChanged", "BufModifiedSet" },
      update = function()
        local ft = vim.bo.filetype
        local name = vim.api.nvim_buf_get_name(0)
        if ft == "TelescopePrompt" or name:match("%[Prompt%]") or name:match("%[Scratch%]") then
          return ""
        end
        return vim.bo.modified and '󱇧' or ''
      end
    },
    " ",
    "%<%f", -- project_root/filename
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
