lua << EOF
require('options')
require('load-plugins')
require('plug-opts')
require('keybindings')

vim.cmd('color onedark')

-- show quotes in JSON files
vim.cmd('set conceallevel=0') -- for some reason it only works when manually sourced and as a command
EOF

" Coc-prettier
" ============
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
nnoremap <C-S-I> :Prettier<CR>

" vim-elixir
" ==========
augroup elixir
  autocmd!
  autocmd BufEnter *.heex set filetype=eelixir "for some reason it does not detect *.heex as documented
augroup END

" Fzf
" =======

let g:gruvbox_contrast_dark = "hard"

" vim-journal
augroup journal
  au!
  autocmd BufNewFile,BufRead *.journal,*.jrnl set filetype=journal
  " autocmd BufNewFile,BufRead  set filetype=journal
augroup END

" markdown
let g:markdown_syntax_conceal = 0

" vim-markdown-folding
augroup markdown
  autocmd FileType markdown set foldexpr=NestedMarkdownFolds() 
  autocmd FileType markdown set formatoptions+=a 
augroup END


