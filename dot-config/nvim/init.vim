lua << EOF
require('options')
require('load-plugins')
require('keybindings')
require('plug-opts')
require('ls')

vim.cmd('color onedark')

-- show quotes in JSON files
vim.cmd('set conceallevel=0') -- for some reason it only works when manually sourced and as a command
EOF


" vim-elixir
" ==========
" augroup elixir
"   autocmd!
"   autocmd BufEnter *.heex set filetype=eelixir "for some reason it does not detect *.heex as documented
" augroup END

" markdown
let g:markdown_syntax_conceal = 0

" vim-markdown-folding
augroup markdown
  autocmd FileType markdown set foldexpr=NestedMarkdownFolds() 
  autocmd FileType markdown set formatoptions+=a 
augroup END


