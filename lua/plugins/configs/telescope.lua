local telescope = require("telescope")
local actions = require("telescope.actions")
local fb_actions = require "telescope._extensions.file_browser.actions"
local lga_actions = require("telescope-live-grep-args.actions")

local function close_buffer(prompt_bufrn)
  local sucess, err = pcall(actions.delete_buffer, prompt_bufrn)

  if not sucess then
    print("Error: This buffer cannot be closed! (" .. err .. ")")
  end
end

local options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "  ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "normal",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 0,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = {
        ["q"] = actions.close,
        ["x"] = close_buffer,
        ["<C-h>"] = actions.file_split,
        ["<Up>"] = actions.cycle_history_prev,
        ["<Down>"] = actions.cycle_history_next,
      },
    },
  },

  pickers = {
    oldfiles = {
      cwd_only = true,
    },
  },

  extensions_list = { "themes", "terms", "fzf", "live_grep_args", "file_browser" },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    live_grep_args = {
      auto_quoting = false,
    },
    file_browser = {
      dir_icon = "",
      path = "%:p:h",
      select_buffer = true,
      grouped = true,
      mappings = {
        n = {
          ["<bs>"] = fb_actions.goto_parent_dir, -- g is the default
          ["e"] = false,
        },
        i = {
          ["<bs>"] = false, -- Unbinding backspace
        }
      }
    }
  },
}

for _, extension in ipairs(options.extensions_list) do
  telescope.load_extension(extension)
end

return options
