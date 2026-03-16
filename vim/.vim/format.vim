if executable('gofmt')
  augroup gofmt
    autocmd!
    autocmd BufWritePre *.go silent! %!gofmt
  augroup END
endif

if executable('rustfmt')
  augroup rustfmt
    autocmd!
    autocmd BufWritePre *.rs silent! %!rustfmt
  augroup END
endif
