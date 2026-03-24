set encoding=utf-8

filetype plugin indent on
syntax on
set noswapfile
set mouse=a
set clipboard=unnamedplus

set path+=**

set number
set relativenumber
set cursorline
set colorcolumn=80
set signcolumn=yes
set scrolloff=10
set splitright
set laststatus=2
set noshowmode
set wildmenu
set showmatch

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set breakindent

set ignorecase
set smartcase
set incsearch
set hlsearch

set nowrap
set list
set listchars=tab:→\ ,space:·

set updatetime=250
set timeoutlen=300

if !isdirectory($HOME .. '/.vim/undodir')
    call mkdir($HOME .. '/.vim/undodir', 'p')
endif
set undofile
set undodir=~/.vim/undodir
