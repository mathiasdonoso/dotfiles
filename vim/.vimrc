let mapleader=" "
set number
set relativenumber
set mouse=a
set noshowmode
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set incsearch
set smartcase
set signcolumn=yes
set updatetime=250
set timeoutlen=300
set splitright
set cursorline
set scrolloff=10
set noswapfile
set hlsearch
set wildmenu
set nowrap
set colorcolumn=80
set showmatch
set laststatus=2
set encoding=utf-8
set breakindent
set autoindent
set smartindent
syntax on
filetype plugin indent on

if has('clipboard')
    set clipboard=unnamedplus
endif

if executable('go')
    let $GOPATH = $HOME . "/go"
    let $PATH = $HOME . "/go/bin:" . $PATH
endif

if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
    nnoremap gr :execute "grep! -R " . expand("<cword>") . " ."<CR>:copen<CR>
endif

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

nnoremap <leader>h :nohlsearch<CR>
nnoremap gd <C-]>
nnoremap - :Ex<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
