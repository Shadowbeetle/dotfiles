vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>hd", ':call CocActionAsync("doHover")<cr>', {noremap = true, silent = true, unique = true})
vim.api.nvim_set_keymap("i", "<c-space>", "coc#refresh()", {noremap = true, silent = true, expr = true})
