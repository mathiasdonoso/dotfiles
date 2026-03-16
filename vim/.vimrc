source ~/.vim/options.vim
source ~/.vim/keybinds.vim
source ~/.vim/plugins.vim
source ~/.vim/colors.vim
source ~/.vim/fzf.vim

if v:version >= 900
    source ~/.vim/lsp.vim
endif

if executable('go')
    let $GOPATH = $HOME . "/go"
    let $PATH = $HOME . "/go/bin:" . $PATH
endif
