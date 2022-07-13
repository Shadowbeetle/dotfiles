-- Coc-prettier
-- ============
vim.api.nvim_create_user_command("Prettier", ":CocCommand prettier.forceFormatDocument", {
  nargs = 0,
  bang = true,
})

vim.api.nvim_set_keymap("n", "<C-S-i>", ":Prettier<CR>", {
  noremap = true,
  silent = true,
})

