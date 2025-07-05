local options = {
  ensure_installed = {
    -- Main Languages
    "c",
    "cpp",
    "python",

    -- Config Languages
    "lua",

    -- Auxiliar Languanges
    "markdown",
    "markdown_inline",
    "vim",
    "regex",
    "bash",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options
