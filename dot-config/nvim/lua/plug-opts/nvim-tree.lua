require'nvim-tree'.setup {
  sync_root_with_cwd = true,
  reload_on_bufenter = true,
  respect_buf_cwd = true,
  git = {
      enable = true,
      ignore = false,
      timeout = 400,
  },
}
vim.g.nvim_tree_respect_buf_cwd = 1
vim.api.nvim_set_keymap('n', '<leader>m', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ff', ':NvimTreeFindFile<CR>', { noremap = true })

