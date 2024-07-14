local plugins = {
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "telescope", "tagbar", "oil" },
      restricted_keys = {
        ["<C-N>"] = {},
        ["<C-P>"] = {},
      },
      enabled = true,
      hint = true,
    }
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "preservim/tagbar", -- sudo apt-get install exuberant-ctags
    lazy = false,
    config = function()
      vim.g.tagbar_width = math.max(30, vim.api.nvim_win_get_width(0) / 5)
      vim.g.tagbar_show_tag_linenumbers = 1
      vim.g.tagbar_no_status_line = 1
      vim.g.tagbar_autofocus = 1
      vim.g.tagbar_wrap = 0
      vim.g.tagbar_sort = 0
      vim.g.tagbar_iconchars = {'', ''}
      vim.g.tagbar_map_togglepause = ''
      vim.api.nvim_set_hl(0, "TagbarComment", {fg = "NONE"})
      vim.api.nvim_set_hl(0, "TagbarHighlight", {bg = "NvimDarkGrey3"})
    end
  },
  {
    "brianaung/yasl.nvim",
    lazy = false,
    opts = {},
    config = function()
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
          " ",
          "%-8.(%l:%c%V%)|%p%%", -- location, and progress
          " ",
        },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "pyright", -- node >= 18.0
        "clangd",
        "codelldb"
      },
    },
  },
}
return plugins
