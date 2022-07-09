call plug#begin()

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'github/copilot.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'troydm/zoomwintab.vim'
Plug 'dstein64/nvim-scrollview'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'         " Comments
Plug 'tpope/vim-repeat'             " Make cs ds yss repeatable
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-signify'            " nicer than gitgutter
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'Yggdroot/indentLine'
Plug 'chrisbra/Colorizer'
Plug 'easymotion/vim-easymotion'    " AceJump like movement
Plug 'dkarter/bullets.vim'
Plug 'wellle/context.vim'           " Keeps the current content always visible
Plug 'antoinemadec/FixCursorHold.nvim'

" Language plugins
Plug 'pantharshit00/vim-prisma'
Plug 'jparise/vim-graphql'
Plug 'elixir-editors/vim-elixir'
Plug 'masukomi/vim-markdown-folding'

" Aesthetics - Colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'zaki/zazen'
Plug 'yuttie/hydrangea-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'gosukiwi/vim-atom-dark'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'joshdick/onedark.vim'
"
" Aesthetics - Others
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'

call plug#end()

filetype on
filetype plugin on
filetype indent on
syntax enable
syntax on

set nohlsearch          " not neaded with easy-motion
set tabstop=2           " when indenting with '>', use 2 spaces width
set shiftwidth=2        " On pressing tab, insert 2 spaces
set expandtab           " use spaces instead of tabs
set wildignore+=node_modules/**
set wildignore+=vendor/**
set wildignore+=package-lock.json
set number              " turn line numbering on
set relativenumber

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

set autochdir           " change directory to currently edited file
set encoding=utf-8
set list                " show non printable characters
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,space:·
set cursorcolumn        " highlight current column
set cursorline
augroup cline
  au!
  au InsertEnter * set nocursorcolumn
  au InsertEnter * set nocursorline
  au InsertEnter * set nolist
  au InsertLeave * set cursorcolumn
  au InsertLeave * set cursorline
  au InsertLeave * set list
augroup END

set splitbelow
set splitright
set mouse=a             " use the mouse in tmux

set swapfile
set directory^=~/.vim/swap//
" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto
" persist the undo tree for each file
set undofile
set undodir^=~/.vim/undo//
set foldmethod=indent
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.go mkview
  autocmd BufWinEnter *.go silent! loadview
augroup END

" map leader to spacebar
let mapleader = " "

:command WQA wqa
:command WQa wqa
:comman Wqa wqa
:command WQ wq
:command Wq wq
:command WA wa
:command Wa wa
:command QA qa
:command Qa qa
:command W w
:command Q q
" edit vimrc in a different split screen
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" show/hid\l non printable characters
nnoremap <leader>ss :set list!<cr>
" specify file to be diffed against the currently open one
nnoremap <leader>df :vert diffsplit 

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap yyy :%y+<cr> " copy whole file to X clipboard

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" copy whole file to X clipboard
nnoremap yyy :%y+<cr>

" remember the directory where vim was opened from
function FindSessionDirectory() abort
  if len(argv()) > 0
    return fnamemodify(argv()[0], ':p:h')
  endif
  return getcwd()
endfunction

let g:session_default_name = FindSessionDirectory()

" CoC
" ===
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>

" Coc-prettier
" ============
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
nnoremap <C-S-I> :Prettier<CR>

" context.vim
" ===========
let g:context_enabled=0 " enabl context on demand

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


" FixCursorHold for better performance
" =============
let g:cursorhold_updatetime = 100

" These `n` & `N` mappings are optional. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

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

set nocompatible
if has("autocmd")
  filetype plugin indent on
endif

" nvim-tree
nnoremap <leader>m :NvimTreeToggle<CR>
nnoremap <leader>ff :NvimTreeFindFile<cr>

lua << EOF
require('lualine-config')
require('nvim-tree-config')
require('treesitter-config')
EOF

color onedark

set termguicolors
