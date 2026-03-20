if executable('fzf')
    if executable('fd')
        let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow'
    endif

    nnoremap <leader>ff :Files<CR>
    nnoremap <leader><leader> :Buffers<CR>

    if executable('rg')
        nnoremap <leader>fw :Rg<CR>
    endif
endif

command! W w
