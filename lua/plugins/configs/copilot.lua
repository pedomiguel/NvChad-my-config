vim.keymap.set("i", "<A-w>", "<Plug>(copilot-accept-word)")
vim.keymap.set("i", "<A-space>", "<Plug>(copilot-suggest)")
vim.keymap.set("i", "<A-]>", "<Plug>(copilot-next)")
vim.keymap.set("i", "<A-[>", "<Plug>(copilot-previous)")
vim.keymap.set("i", "<A-h>", "<Plug>(copilot-dismiss)")

vim.keymap.set("i", "<A-l>", "copilot#Accept('')", {
  expr = true,
  replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

vim.g.copilot_enabled = false
