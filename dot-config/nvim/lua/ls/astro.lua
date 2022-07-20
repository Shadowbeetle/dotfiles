vim.cmd [[
  augroup astro
    au!
    autocmd FileType astro set foldexpr=NestedAstroFolds()
    autocmd FileType astro set formatoptions-=a
  augroup END
]]
