" Syntax highlighting
" ===================
filetype on
filetype plugin on
filetype indent on
syntax enable
syntax on

set tabstop=2           " when indenting with '>', use 2 spaces width
set shiftwidth=2        " On pressing tab, insert 2 spaces
set expandtab           " use spaces instead of tabs
set number              " turn line numbering on
set undofile
set undolevels=1000
set autochdir           " change directory to currently edited file

nmap <C-n> O<Esc>0       " add newline above cursor when Enter is hit in Normal mode. does not work in terminal vim 
nmap <CR> o<Esc>0k      " add newline below cursor when Enter is hit in Normal mode 

" Plugins
" ===================
call plug#begin('~/.vim/bundle')

Plug 'airblade/vim-gitgutter'       " Nice git lines at the side

Plug 'tpope/vim-surround'           " Surround
Plug 'tpope/vim-commentary'         " Commentary

Plug 'rhysd/vim-grammarous', { 'on': 'GrammarousCheck' } " English spell check
Plug 'easymotion/vim-easymotion'    " AceJump like movement
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pangloss/vim-javascript'      " JavaScript syntax highlighting
Plug 'Raimondi/delimitMate'

call plug#end()

" YouCompleteMe
" ===================
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python2'

" EasyMotion
" ===================
" n-character search 
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are optional. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" NERDTree
" ==================
nnoremap <silent> <leader>m :NERDTreeToggle<CR>
autocmd vimenter * NERDTree " NERDTree automatically when vim starts up

" start NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" GitGutter
" =========
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterUndoHunk
