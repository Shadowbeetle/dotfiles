return require("packer").startup({
  function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    -- Better profiling
    use{'dstein64/vim-startuptime'}


    use({'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}})
    use({'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons'}})
    use({'neoclide/coc.nvim', branch = 'release'})
    use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
    use({'nvim-treesitter/nvim-treesitter-refactor'})
    use({'p00f/nvim-ts-rainbow'})
    -- use({'github/copilot.vim'})
    use({'mg979/vim-visual-multi', branch = 'master'})
    use({'troydm/zoomwintab.vim'})
    use({'dstein64/nvim-scrollview'})

    -- TPOPE BEST POPE
    -- Git interactions within VIM (blame and diff)
    use({"tpope/vim-fugitive", event = "VimEnter"})
    use({"tpope/vim-sensible", event = "VimEnter"})
    -- Surround
    use({"tpope/vim-surround", event = "VimEnter"})
    -- Better substitute with Subvert
    use({"tpope/vim-abolish", event = "VimEnter"})
    -- Comment plugin
    use({"tpope/vim-commentary"})
    -- Repeat last command with.
    use({"tpope/vim-repeat", event = "VimEnter"})
    -- Additional paired mappings
    use({"tpope/vim-unimpaired", event = "VimEnter"})
    -- Autopair characters and do blocks
    use({"tpope/vim-endwise", event = "VimEnter"})

    use({"Raimondi/delimitMate", event = "InsertEnter"}) -- Autopair characters and do blocks
    use({"christoomey/vim-tmux-navigator", event = "VimEnter"})
    use({"airblade/vim-gitgutter", event = "VimEnter"})
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    -- use({"junegunn/fzf", event = "VimEnter"})
    -- use({"junegunn/fzf.vim", event = "VimEnter"})
    use({'ibhagwan/fzf-lua', branch = 'main', requires = {'junegunn/fzf', 'junegunn/fzf.vim'}})
    use({"itchyny/vim-highlighturl", event = "VimEnter"}) -- Highlight URLs inside vim
    use({"bronson/vim-visual-star-search", event = "VimEnter"}) -- Better star search
    use({'Yggdroot/indentLine'})
    -- use({'chrisbra/Colorizer'})
    use({'norcalli/nvim-colorizer.lua'})
    use({'easymotion/vim-easymotion'}) -- AceJump like movement
    use({'dkarter/bullets.vim'})
    use({'antoinemadec/FixCursorHold.nvim'})

    -- Language plugins
    use({'pantharshit00/vim-prisma'})
    use({'jparise/vim-graphql'})
    -- use({'elixir-editors/vim-elixir'})
    use({'masukomi/vim-markdown-folding'})

    -- Aesthetics - Colorschemes
    use({'dracula/vim', as = 'dracula'})
    use({'zaki/zazen'})
    use({'yuttie/hydrangea-vim'})
    use({'gruvbox-community/gruvbox'})
    use({'sonph/onehalf', rtp = 'vim' })
    use({'gosukiwi/vim-atom-dark'})
    use({'kyoz/purify', rtp = 'vim'})
    use({'joshdick/onedark.vim'})
    --
    -- Aesthetics - Others
    use({'junegunn/rainbow_parentheses.vim'})
    use({'junegunn/limelight.vim'})
    use({'junegunn/vim-journal'})

    use({'theHamsta/nvim_rocks', run = 'pip3 install --user hererocks && python3 -mhererocks . -j2.1.0-beta3 -r3.0.0 && cp nvim_rocks.lua lua'})
  end,
})


