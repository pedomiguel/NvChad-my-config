local plugins = {
  {
    "preservim/tagbar",
    event = "VeryLazy",
    config = function()
      vim.g.tagbar_width = math.max(30, vim.api.nvim_win_get_width(0) / 5)
      vim.g.tagbar_show_tag_linenumbers = 1
      vim.g.tagbar_no_status_line = 1
      vim.g.tabar_sort = 0
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
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
        "pyright",
        "clangd",
        "codelldb"
      },
    },
  },
}
return plugins
