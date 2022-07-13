vim.g.markdown_syntax_conceal = 0

-- vim-markdown-folding
vim.cmd [[
  augroup markdown
    autocmd FileType markdown set foldexpr=NestedMarkdownFolds() 
    autocmd FileType markdown set formatoptions+=a 
  augroup END
]]
