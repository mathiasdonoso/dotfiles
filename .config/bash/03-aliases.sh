# Filesystem
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'

# ls colors (requires dircolors, set in .bashrc)
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Navigation — requires fzf + fd
if command -v fzf &>/dev/null && command -v fd &>/dev/null; then
    alias f='cd "$(fd . "$HOME/code" --type d --min-depth 2 --max-depth 2 | fzf)"'
fi

# Tmux — requires fzf
if command -v fzf &>/dev/null; then
    alias t='tmux attach -t "$(tmux ls | fzf | awk -F: '"'"'{print $1}'"'"')"'
fi
alias s='tmux new-session -s "$(basename "$PWD")"'
alias kill-tmux-sessions='tmux list-sessions -F "#{session_name}" | xargs -I {} tmux kill-session -t {}'

# Git
command -v lazygit &>/dev/null && alias lg='lazygit'

# Background images — require fzf, fd, feh
if command -v feh &>/dev/null && command -v fzf &>/dev/null && command -v fd &>/dev/null; then
    alias bb='fd ".*\.(png|jpg|jpeg)" "$HOME/Pictures/anime/" | fzf --algo=v1 --delimiter / --with-nth -1 --preview="feh --bg-fill {}" | xargs -I {} feh --bg-fill {}'
    alias bg='changebg'
fi

# System
alias :q='exit'
alias resetkb='setxkbmap -layout us,latam -option grp:alt_shift_toggle'
alias resetx='xrandr --output DP-1 --brightness 0.75 --mode 2560x1440 --left-of eDP-1'

# Alert for long running commands: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '"'"'s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'"'"')"'
