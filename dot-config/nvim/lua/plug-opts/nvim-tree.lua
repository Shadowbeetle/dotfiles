require'nvim-tree'.setup {
    git = {
        enable = true,
        ignore = false,
        timeout = 400,
    },
}

vim.api.nvim_set_keymap('n', '<leader>m', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ff', ':NvimTreeFindFile<CR>', { noremap = true })

