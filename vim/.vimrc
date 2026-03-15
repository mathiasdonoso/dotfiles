source ~/.vim/options.vim
source ~/.vim/keybinds.vim
source ~/.vim/plugins.vim
source ~/.vim/colors.vim

source ~/.vim/fzf.vim

if executable('go')
    let $GOPATH = $HOME . "/go"
    let $PATH = $HOME . "/go/bin:" . $PATH
endif


