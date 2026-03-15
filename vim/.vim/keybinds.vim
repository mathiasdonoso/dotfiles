let mapleader=" "

nnoremap <leader>h :nohlsearch<CR>
nnoremap gd <C-]>

nnoremap - :Ex<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap n nzzzv
nnoremap N Nzzzv

inoremap <C-c> <Esc>

nnoremap <C-j> :lnext<CR>
nnoremap <C-k> :lprev<CR>

nnoremap Q <nop>

if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
    nnoremap gr :execute "grep! " . expand("<cword>") . " ."<CR>:copen<CR>
endif
