vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.undofile = true
vim.opt.title = true -- Set title of the window
vim.opt.clipboard = "unnamedplus" -- Use OS clipboard
vim.opt.encoding = "UTF-8"
vim.opt.mouse = "a"
vim.opt.list = true -- Display invisibles
vim.opt.listchars = "tab:▸ ,eol:¬,extends:❯,precedes:❮,space:·"
vim.opt.showbreak = "↪"
vim.opt.visualbell = true -- No noise just flash
vim.opt.splitbelow = true -- Horizontal splits open below the current window
vim.opt.splitright = true -- Vertical splits open right to the current window
vim.opt.termguicolors = true -- Enable true color support in terminal
vim.opt.backup = false
vim.opt.autowrite = true
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 15
vim.opt.sidescroll = 3

-- Visual tweaks
vim.opt.conceallevel = 0
vim.cmd [[
  augroup cline
    au!
    au InsertEnter * set nocursorcolumn
    au InsertEnter * set nocursorline
    au InsertEnter * set nolist
    au InsertLeave * set cursorcolumn
    au InsertLeave * set cursorline
    au InsertLeave * set list
  augroup END
]]


vim.opt.number = true -- Display number on the sidebar
vim.cmd [[
  augroup numbering  
    autocmd!
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
  augroup END
]]

vim.opt.textwidth = 120
vim.opt.wrap = false
vim.opt.linebreak = true

-- Real programmers don't use TABs but spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true

-- Folding for navigation
vim.opt.foldmethod = "indent"
-- vim.opt.foldmethod = "manual"
vim.opt.foldlevel = 99 -- Start with default open folds
vim.cmd [[
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.go mkview
    autocmd BufWinEnter *.go silent! loadview
  augroup END
]]

-- Search tweaks
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true -- Set /g flag regex search
