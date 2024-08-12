local plugins = {

  {
    'echasnovski/mini.ai',
    lazy = false,
    version = false,
    branch = "main",
    config = function ()
      return require "plugins.configs.miniai"
    end,
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function ()
      return require "plugins.configs.leap"
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
      return require "plugins.configs.tagbar"
    end
  },

  {
    "brianaung/yasl.nvim",
    lazy = false,
    opts = {},
    config = function()
      return require "plugins.configs.yasl"
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
    "williamboman/mason-lspconfig.nvim",
  },

  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function ()
      local lint = require("lint")

      lint.linters_by_ft = {
        lua = { "luacheck", },
        cpp = { "cpplint", },
        python = { "pylint", },
      }
    end
  }

}

return plugins
