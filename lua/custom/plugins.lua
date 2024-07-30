local plugins = {

  {
    'echasnovski/mini.ai',
    lazy = false,
    version = false,
    branch = "main",
    config = function ()
      require('mini.ai').setup()
    end,
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function ()
      local leap = require("leap")
      leap.opts.case_sensitive = true
    end,
    dependencies = { "tpope/vim-repeat" },
  },

  {
    "tpope/vim-repeat",
    lazy = false,
  },

  {
    "tpope/vim-surround",
    lazy = false,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "preservim/tagbar", -- sudo apt-get install exuberant-ctags
    lazy = false,
    config = function()
      vim.g.tagbar_width = math.max(30, vim.api.nvim_win_get_width(0) / 5)
      vim.g.tagbar_show_tag_linenumbers = true
      vim.g.tagbar_no_status_line = true
      vim.g.tagbar_autofocus = true
      vim.g.tagbar_wrap = false
      vim.g.tagbar_sort = false
      vim.g.tagbar_iconchars = {'', ''}
      vim.g.tagbar_map_togglepause = ''
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
          "%-8.(%l:%c%V%) %P", -- location, and progress
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
      },
    },
  },
}

return plugins
