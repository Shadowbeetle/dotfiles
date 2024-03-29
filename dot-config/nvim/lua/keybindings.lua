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

-----------------------------------------------------------------------------------------------------------------------
vim.api.nvim_create_user_command('ChangeToCurrentBufferDir', 'lcd %:p:h', { -- %: current buffer :p: path :h: "head" = dirname
  bang = true
})

vim.api.nvim_set_keymap('n', '<leader>cd', ':ChangeToCurrentBufferDir<cr>', { noremap = true, silent = true })
-----------------------------------------------------------------------------------------------------------------------
-- Edit and source .vimrc / init.vim / init.lua
local function openVimrcTab ()
  vim.cmd[[ 
    tabnew $MYVIMRC
    lcd %:p:h
  ]] -- %: current buffer :p: path :h: "head" = dirname
end

vim.api.nvim_create_user_command('OpenVimrcTab', openVimrcTab, {
  bang = true
})

vim.api.nvim_set_keymap('n', '<leader>ev', ':OpenVimrcTab<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sv', ':luafile $MYVIMRC<cr>', { noremap = true })

-----------------------------------------------------------------------------------------------------------------------
-- Use nvim as pager in case I'd forget that Fzf probably has a searchable list for that
local function pageInVim (argsTable)
  local command = argsTable.args
  vim.api.nvim_command('redir @m')
  vim.api.nvim_command("silent " .. command)
  vim.api.nvim_command([[
    redir END
    new
    put m
  ]])
end

vim.api.nvim_create_user_command('PageInVim', pageInVim, {
  nargs = 1,
  bang = true,
  complete = "command"
})

