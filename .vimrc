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

nmap <C-n> O<Esc>       " add newline above cursor when Enter is hit in Normal mode. does not work in terminal vim 
nmap <CR> o<Esc>        " add newline below cursor when Enter is hit in Normal mode 
inoremap hh <Esc>       " make `hh` work like ESC

" Plugins
" ===================
call plug#begin('~/.vim/bundle')

Plug 'airblade/vim-gitgutter'       " Nice git lines at the side
Plug 'tpope/vim-commentary'         " Commentary

Plug 'rhysd/vim-grammarous', { 'on': 'GrammarousCheck' } " English spell check

call plug#end()

" Setup YouCompleteMe
" ===================
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python2'
