# General
alias update='source $SUPERCHARGED/scripts/update.sh'
alias dots='cd $SUPERCHARGED'
alias zshconfig="$EDITOR $SUPERCHARGED/zsh/custom/custom.local.zsh"
alias reload="source ~/.zshrc"

## TAR Tooling
alias pack='f() { tar -cvf $1.tar $1};f'
alias compress='f() { tar -cvzf $1.tgz $1};f'
alias compress7z='f() { 7z a $1.7z $1 };f'

# NPM Tooling
alias npm-global="npm list -g --depth=0"
alias npm-reset="rm -rf node_modules/ && npm cache clean --force && npm i"

# Docker Tooling
alias docker-wipeout='docker container rm --force $(docker container ls -a -q) && docker image rm --force $(docker image ls -a -q) && docker image prun --force'

# Chrome
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

## Shell Aliases
alias tconfig="$EDITOR ~/.tmux.conf"

alias password='openssl rand -base64 ${1:-22} | pbcopy ; echo "$(pbpaste)"'

alias cat='bat --style=plain,header,grid'
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias edit='"$EDITOR" $(preview)'
alias top="htop"
alias l="ls -lahF"
alias ll="ls -F"
alias le="eza -lga --git"
alias lle="eza -Ta"
alias py="python3"
alias gdk="git difftool"

# Kubernetes
export yaml='--dry-run=client -o yaml' # This way you can just run k run pod --image=nginx ${=yaml}.
export now="--force --grace-period O" # This way you can run k delete pod ${=now}.
