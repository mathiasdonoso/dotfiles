if has('termguicolors')
    " vim has no idea about alacritty true escape codes :S
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
    packloadall
    let ayucolor="mirage"
    colorscheme ayu

    " Transparent background
    highlight Normal guibg=NONE ctermbg=NONE
    highlight NonText guibg=NONE ctermbg=NONE
    highlight SignColumn guibg=NONE ctermbg=NONE
    highlight LineNr guibg=NONE ctermbg=NONE
    highlight CursorLineNr guibg=NONE ctermbg=NONE
endif
