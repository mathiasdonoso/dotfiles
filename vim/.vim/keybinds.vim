let mapleader=" "

nnoremap <leader>h :nohlsearch<CR>

nnoremap - :Ex<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap < <gv
vnoremap > >gv

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap n nzzzv
nnoremap N Nzzzv

inoremap <C-c> <Esc>

nnoremap <C-j> :lnext<CR>
nnoremap <C-k> :lprev<CR>

nnoremap Q <nop>
nnoremap <Left>  <nop>
nnoremap <Right> <nop>
nnoremap <Up>    <nop>
nnoremap <Down>  <nop>
