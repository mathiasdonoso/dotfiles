if executable('fzf')
    if executable('fd')
        let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude ".cache" --exclude "*.min.js" --exclude "*.min.css"'
    endif

    nnoremap <leader>ff :Files<CR>
    nnoremap <leader>fr :call fzf#vim#files('', {'source': 'fd --type f --hidden --follow --exclude ".cache" --exclude "*.min.js" --exclude "*.min.css" --regex "' . input('regex: ') . '"', 'options': '--preview "bat --color=always --style=plain {}"'})<CR>
    nnoremap <leader><leader> :Buffers<CR>

    function! LiveGrep(query, fullscreen)
        if executable('rg')
            let cmd = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
            let has_col = 1
        else
            let cmd = 'grep -rn --color=always -- %s . || true'
            let has_col = 0
        endif
        let initial = printf(cmd, shellescape(a:query))
        let reload  = printf(cmd, '{q}')
        let spec = fzf#vim#with_preview({'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload]})
        call fzf#vim#grep(initial, has_col, spec, a:fullscreen)
    endfunction
    command! -bang -nargs=* Rg call LiveGrep(<q-args>, <bang>0)
    nnoremap <leader>fw :Rg<CR>
endif

command! W w
