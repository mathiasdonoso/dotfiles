parse_git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

changebg() {
    feh --bg-fill --no-fehbg --randomize "$HOME/Pictures/anime/"*.{png,jpg,jpeg}
}
