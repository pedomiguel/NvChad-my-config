local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local vscode_snip = require("luasnip.loaders.from_vscode")
local from_snipmate_snip = require("luasnip.loaders.from_snipmate")
local from_lua_snip = require("luasnip.loaders.from_lua")

-- vscode format
vscode_snip.lazy_load()
vscode_snip.lazy_load { paths = vim.g.vscode_snippets_path or "" }

-- snipmate format
from_snipmate_snip.load()
from_snipmate_snip.lazy_load { paths = vim.g.snipmate_snippets_path or "~/.config/nvim/snippets" }

-- lua format
from_lua_snip.load()
from_lua_snip.lazy_load { paths = vim.g.lua_snippets_path or "" }

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    if
      ls.session.current_nodes[vim.api.nvim_get_current_buf()]
      and not ls.session.jump_active
    then
      ls.unlink_current()
    end
  end,
})

-- Custom snippets

ls.add_snippets("python", {
  s("main", {
    t('if __name__ == "__main__":'),
    t({ "", "\t" }),
    i(1, "pass")
  }),

  s("def", {
    t("def "),
    i(1, "fname"),
    t("("),
    i(2, ""),
    t(") -> "),
    i(3, "None"),
    t({ ":", "\t" }),
    i(4, "pass"),
  }),

  s("strict", {
    t('# pyright: strict'),
  }),

  s("X_train", {
    t('X_train, X_test, y_train, y_test = train_test_split('),
    i(1, "X"),
    t(", "),
    i(2, "y"),
    t(", "),
    t("test_size="),
    i(3, "0.3"),
    t(", random_state="),
    i(4, "42"),
    t(")"),
  }),

  s("ic", {
    t('ic ('),
    i(1, "content"),
    t(")"),
  })

})
