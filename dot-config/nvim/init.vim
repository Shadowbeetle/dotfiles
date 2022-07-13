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

" EasyMotion
" ==========
" n-character search 
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1

" vim-elixir
" ==========
augroup elixir
  autocmd!
  autocmd BufEnter *.heex set filetype=eelixir "for some reason it does not detect *.heex as documented
augroup END

" Fzf
" =======
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-f> <plug>(fzf-complete-path)
" nmap <C-p> :GFiles<CR>
nmap <C-p> :FzfLua git_files<CR>
" nmap <C-g> :FZF<CR>
command! -bang ListFiles call fzf#vim#files(g:session_default_name, fzf#vim#with_preview(), 1)
nmap <C-g> :ListFiles<CR>
command GF FzfLua git_status
command Gf FzfLua git_status

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

" nvim-tree
nnoremap <leader>m :NvimTreeToggle<CR>
nnoremap <leader>ff :NvimTreeFindFile<cr>


" set conceallevel=0


