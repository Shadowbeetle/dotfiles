vim.g.markdown_syntax_conceal = 0

-- vim-markdown-folding
vim.cmd [[
  augroup markdown
    au!
    autocmd FileType markdown set foldexpr=NestedMarkdownFolds() 
  augroup END
]]
