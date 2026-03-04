set number
set relativenumber
set mouse=a
set noshowmode
set clipboard=unnamedplus
set undofile
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

set grepprg=rg\ --vimgrep
set grepformat=%f:%l:%c:%m

set breakindent
set autoindent
set smartindent

syntax on
filetype plugin indent on

let $GOPATH = $HOME . "/go"
let $PATH = $HOME . "/go/bin:" . $PATH
