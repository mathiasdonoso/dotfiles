#
# ~/.bashrc
#
source /usr/share/git/completion/git-prompt.sh
source /usr/share/git/completion/git-completion.bash

# If not running interactively, don't do anything!
[[ $- != *i* ]] && return

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Enable history appending instead of overwriting.
shopt -s histappend

# Try to keep environment pollution down, EPA loves us.
unset safe_term match_lhs

# Try to enable the auto-completion (type: "pacman -S bash-completion" to install it).
# [ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Try to enable the "Command not found" hook ("pacman -S pkgfile" to install it).
# See also: https://wiki.archlinux.org/index.php/Bash#The_.22command_not_found.22_hook
# [ -r /usr/share/doc/pkgfile/command-not-found.bash ] && . /usr/share/doc/pkgfile/command-not-found.bash

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# disable ctrl+s
stty -ixon

# where do I put my aliases?
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias f='cd $(find "$HOME/code" -mindepth 2 -maxdepth 2 -type d | fzf)'
alias t='tmux attach -t "$(tmux ls | fzf | awk -F '"'"':'"'"' '"'"'{print $1}'"'"')"'
alias s='tmux new-session -s "$(basename $PWD)"'
alias vim='nvim'
alias :q='exit'
alias resetkb='setxkbmap -layout us,latam -option grp:alt_shift_toggle'
alias lg='lazygit'
alias ld='lazydocker'

# some very important keybindings
bind '"\C-f": "f\nclear\n"'
bind '"\C-t": "t\nclear\n"'
bind '"\C-s": "s\nclear\n"'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/ \(.*\)/(\1)/'
}

# Tmux status bar with git branch
PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

function changebg() {
    feh --bg-fill --randomize ~/Pictures/anime/*.{png,jpg,jpeg}
}

alias bg='changebg'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# CGO_ENABLED=1

export GOPATH=$HOME/go

PATH=$PATH:$HOME/go/bin
# PATH=$PATH:$HOME/.cargo/bin

. "$HOME/.cargo/env"
