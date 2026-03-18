function! SafeFormat(cmd)
    let l:current_code = join(getline(1, '$'), "\n")
    let l:output = system(a:cmd, l:current_code)
    if v:shell_error == 0
        let l:lines = split(l:output, "\n", 1)
        silent! undojoin
        call setline(1, l:lines)
        if len(l:lines) < line('$')
            call deletebufline('%', len(l:lines) + 1, '$')
        endif
    else
        echohl ErrorMsg | echo "Format failed (Syntax Error). Code not changed." | echohl None
    endif
endfunction

augroup QuickFormat
    autocmd!
    if executable('gofmt')
        autocmd BufWritePre *.go call SafeFormat('gofmt')
    endif
    if executable('rustfmt')
        autocmd BufWritePre *.rs call SafeFormat('rustfmt')
    endif
    if executable('ruff')
        autocmd BufWritePre *.py call SafeFormat('ruff format -')
    endif
augroup END
