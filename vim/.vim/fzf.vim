if executable('fzf')
    if executable('fd')
        let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude ".cache" --exclude "*.min.js" --exclude "*.min.css"'
    endif

    nnoremap <leader>ff :Files<CR>
    nnoremap <leader>fr :call fzf#vim#files('', {'source': 'fd --type f --hidden --follow --exclude ".cache" --exclude "*.min.js" --exclude "*.min.css" --regex "' . input('regex: ') . '"', 'options': '--preview "bat --color=always --style=plain {}"'})<CR>
    nnoremap <leader><leader> :Buffers<CR>

    if executable('rg')
        command! -bang -nargs=* Rg
                    \ call fzf#vim#grep(
                    \   'rg --column --line-number --no-heading --color=always --smart-case --pcre2 -- '.shellescape(<q-args>),
                    \   fzf#vim#with_preview(),
                    \   <bang>0)
        nnoremap <leader>fw :Rg<CR>
    endif
endif

command! W w
