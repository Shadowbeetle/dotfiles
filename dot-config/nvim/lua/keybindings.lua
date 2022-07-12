vim.g.mapleader = " "

-- Typo protector lvl: 99999
vim.api.nvim_create_user_command('E', 'e<bang> <args>', {
  bang = true,
  nargs = '?',
  complete = "file"
})
vim.api.nvim_create_user_command('W', 'w<bang> <args>', {
  bang = true,
  nargs = '?',
  complete = "file"
})
vim.api.nvim_create_user_command('Wq', 'wq<bang> <args>', {
  bang = true,
  nargs = '?',
  complete = "file"
})
vim.api.nvim_create_user_command('WQ', 'wq<bang> <args>', {
  bang = true,
  nargs = '?',
  complete = "file"
})
vim.api.nvim_create_user_command('Wa', 'wa<bang>', {
  bang = true
})
vim.api.nvim_create_user_command('WA', 'wa<bang>', {
  bang = true
})
vim.api.nvim_create_user_command('Q', 'q<bang>', {
  bang = true
})
vim.api.nvim_create_user_command('Qa', 'qa<bang>', {
  bang = true
})
vim.api.nvim_create_user_command('QA', 'qa<bang>', {
  bang = true
})
vim.api.nvim_create_user_command('Wqa', 'wqa<bang> <args>', {
  bang = true,
  nargs = '?',
  complete = "file"
})
vim.api.nvim_create_user_command('WQa', 'wqa<bang> <args>', {
  bang = true,
  nargs = '?',
  complete = "file"
})
vim.api.nvim_create_user_command('WQA', 'wqa<bang> <args>', {
  bang = true,
  nargs = '?',
  complete = "file"
})

-- Better moving blocks in visual mode
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- Easier window management
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>a', 'ggVG', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'yyy', ':%y+<cr>', { noremap = true })

-- Edit .vimrc / init.vim / init.lua
vim.api.nvim_set_keymap('n', '<leader>ev', ':vsplit $MYVIMRC<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sv', ':source $MYVIMRC<cr>', { noremap = true })

