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

if executable('ruff')
  augroup ruffmt
    autocmd!
    autocmd BufWritePre *.py silent! %!ruff format -
  augroup END
endif
