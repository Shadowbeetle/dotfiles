vim.cmd [[
  augroup journal
    au!
    autocmd BufNewFile,BufRead *.journal,*.jrnl set filetype=journal
    " autocmd BufNewFile,BufRead  set filetype=journal
  augroup END
]]
