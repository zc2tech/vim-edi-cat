augroup vim-edi-cat
  autocmd!
  autocmd BufRead,BufNewFile *.x12 set filetype=x12
  autocmd BufRead,BufNewFile *.edi,*.edifact set filetype=edifact
augroup END
