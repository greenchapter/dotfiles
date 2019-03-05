# Set locales
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Path to supercharged profile.
SUPERCHARGED=$HOME/.dotfiles

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lukerandall"

DEFAULT_USER=`whoami`

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=7

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(ranger tmux git sublime code git-extras heroku nvm zsh-nvm extract last-working-dir zsh-better-npm-completion docker fzf)

source $ZSH/oh-my-zsh.sh

# Load all Supercharged aliases
for f in $SUPERCHARGED/oh-my-zsh/aliases/*; do source $f; done

### User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"
# SSH private key path
export SSH_KEY_PATH="~/.ssh/rsa_id"
# deactivate NVM lazy loading
export NVM_LAZY_LOAD=false
# Add Visual Studio Code to the prompt
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# restyle the zsh prompt
export PS1='%{$fg_bold[green]%}%n@localhost%{$reset_color%} %{$fg_bold[blue]%}%2~%{$reset_color%} $(my_git_prompt_info)%{$reset_color%}%B»%b '
alias upgrade_supercharged='sh $SUPERCHARGED/tools/upgrade.sh'
alias upgrade_supercharged='source ~/.dotfiles/scripts/upgrade.sh'

## TAR Tooling
alias pack='f() { tar -cvf $1.tar $1};f'
alias compress='f() { tar -cvzf $1.tgz $1};f'
alias compress7z='f() { 7z a $1.7z $1 };f'

# NPM Tooling
alias npm-global="npm list -g --depth=0"
alias npm-reset="rm -rf node_modules/ && npm cache clean --force && npm i"

# Docker Tooling
# remove all docker related container and images
alias docker-wipeout='docker container rm $(docker container ls -a -q) && docker image rm $(docker image ls -a -q) && docker image prune'

# Chrome
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

fpath=(/usr/local/share/zsh-completions $fpath)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# This loads nvm bash_completion
  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

# Wasmer
export WASMER_DIR="$HOME/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/thomas.ott/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/thomas.ott/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/thomas.ott/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/thomas.ott/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/sbin:$PATH"
