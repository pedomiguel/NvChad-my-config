-- n, v, i, t = mode names

local M = {}

M.general = {
  i = {
    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "Move left" },
    ["<C-l>"] = { "<Right>", "Move right" },
    ["<C-j>"] = { "<Down>", "Move down" },
    ["<C-k>"] = { "<Up>", "Move up" },

    -- return to normal mode
    ["jk"] = { "<Esc>", "Return to normal mode" }
  },

  n = {
    ["<Esc>"] = { "<cmd> noh <CR>", "Clear highlights" },

    -- adding blank lines
    ["zj"] = { "o<Esc>k", "Add blank line below" },
    ["zk"] = { "O<Esc>j", "Add blank line above" },

    -- Move lines
    ["<A-j>"] = { '"0ddp', "Move line down" },
    ["<A-k>"] = { '"0ddkP', "Move line up" },

    -- break the line
    ["gj"] = { "i<CR><Esc>k$", "Break the line" },

    --[[ -- switch between windows
    ["<C-h>"] = { "<C-w>h", "Window left" },
    ["<C-l>"] = { "<C-w>l", "Window right" },
    ["<C-j>"] = { "<C-w>j", "Window down" },
    ["<C-k>"] = { "<C-w>k", "Window up" }, ]]

    -- Overring for tmux plugin navigation
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "Window Left"},
    ["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "Window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "Window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "Window up" },


    -- Resize windows
    ["<C-Up>"] = { "<cmd> resize +2 <CR>", "Decrease vertical window size" },
    ["<C-Down>"] = { "<cmd> resize -2 <CR>", "Increase vertical window size" },
    ["<C-Right>"] = { "<cmd> vertical resize +2 <CR>", "Increase horizontal window size" },
    ["<C-Left>"] = { "<cmd> vertical resize -2 <CR>", "Decrease horizontal window size" },

    -- Copy all
    ["<C-c>"] = { "<cmd> %y+ <CR>", "Copy whole file" },
    -- Copy to clipboard register
    ["<C-y>"] = { '"+yy', "Copy line"},
    --Highlight all
    ["<leader>ha"] = { "<cmd> HighlightAll <CR>", "Highlight whole file" },

    -- Navigation
    ["<C-d>"] = { "<C-d>zz" ,"Scroll down half screen" },
    ["<C-u>"] = { "<C-u>zz", "Scroll up half screen" },

    ["gi"] = { "ggO", "Insert in the beggining of the file" },
    ["ga"] = { "Go", "Insert in the end of the file" },

    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    -- empty mode is same as using <cmd> :map
    -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },

    -- manage buffers
    ["<leader>b"] = { "<cmd> enew <CR>", "New buffer" },
    ["<leader>x"] = { "<cmd> bdelete <CR>", "Close current buffer" },
    ["<Tab>"] = { "<cmd> bnext <CR>", "Go to next buffer" },
    ["<S-Tab>"] = { "<cmd> bprevious <CR>", "Go to previous buffer" },

    ["<leader>ch"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },

    -- quickfix list navigation
    ["]q"] = { "<cmd> cnext <CR>", "Go to next buffer in quickfix list" },
    ["[q"] = { "<cmd> cprevious <CR>", "Go to previous buffer in quickfix list" },

    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },

    -- folding
    ["<leader>fc"] = {
      function()
        vim.wo.foldcolumn = (vim.wo.foldcolumn == "0") and "1" or "0"
      end,
      "Toggle fold column"
    },
  },

  v = {
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["<"] = { "<gv", "Indent line" },
    [">"] = { ">gv", "Indent line" },
    ["<C-y>"] = { '"+y', "Copy to clipboard register" },
  },

  x = {
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<leader>/"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<leader>/"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["gl"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float { border = nil , source = true, }
      end,
      "Floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.jump { count = -1 }
      end,
      "Goto prev diagnostic",
    },

    ["]d"] = {
      function()
        vim.diagnostic.jump { count = 1 }
      end,
      "Goto next diagnostic",
    },
  },

  v = {
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep_args <CR>", "Live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["<leader>ft"] = { "<cmd> Telescope file_browser <CR>", "Open File Browser" },
    ["<leader>fs"] = { "<cmd> Telescope lsp_document_symbols <CR>", "Find Symbols" },
    ["<leader>fn"] = { "<cmd> Telescope noice <CR>", "Noice History" },

    -- git
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- ui
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

    -- diagnostic
    ["<leader>fd"] = { "<cmd> Telescope diagnostics <CR>", "Telescope diagnostics"},

    -- vim marks and registers
    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "Telescope bookmarks" },
    ["<leader>rg"] = { "<cmd> Telescope registers <CR>", "Telescope registers" },
  },
}

M.whichkey = {
  plugin = true,

  n = {
    ["<leader>wK"] = {
      function()
        vim.cmd "WhichKey"
      end,
      "Which-key all keymaps",
    },
    ["<leader>wk"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "Which-key query lookup",
    },
  },
}

M.gitsigns = {
  plugin = true,

  n = {
    -- Navigation through hunks
    ["]c"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["[c"] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },

    -- Actions
    ["<leader>rh"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },

    ["<leader>ph"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },

    ["<leader>sh"] = {
      function ()
        require("gitsigns").stage_hunk()
      end,
      "Stage hunk",
    },

    ["<leader>gb"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "Blame line",
    },

    ["<leader>td"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
  },
}

M.leap = {
  n = {
    ["s"] = { "<Plug>(leap-anywhere)", "Leap forward" },
  },
  o = {
    ["s"] = { "<Plug>(leap-anywhere)", "Leap forward" },
  },
}

M.tagbar = {
  n = {
    ["<leader>tt"] = { "<cmd> TagbarToggle <CR>", "Toggle Tagbar" },
  }
}

return M
