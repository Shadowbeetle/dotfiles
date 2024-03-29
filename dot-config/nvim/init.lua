require('load-plugins')
require('load-lua-libs')
require('options')
require('keybindings')
require('plug-opts')
require('ls')

vim.cmd('color onedark')

-- show quotes in JSON files
vim.cmd('set conceallevel=0') -- for some reason it only works when manually sourced and as a command

-- " vim-elixir
-- " ==========
-- " augroup elixir
-- "   autocmd!
-- "   autocmd BufEnter *.heex set filetype=eelixir "for some reason it does not detect *.heex as documented
-- " augroup END


