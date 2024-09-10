local plugins = {

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
    init = function()
      require("lazy.core.loader").disable_rtp_plugin "nvim-treesitter-textobjects"
    end,
  },

  {
    'echasnovski/mini.ai',
    lazy = false,
    version = false,
    branch = "main",
    config = function ()
      return require "plugins.configs.miniai"
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
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


}

return plugins
