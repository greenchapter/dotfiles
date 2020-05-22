# Set locales
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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
plugins=(history-substring-search tmux git sublime vscode git-extras nvm extract last-working-dir npm docker encode64 zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

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
function nvm_prompt_version {
    if which nvm &> /dev/null; then
        if [[ $(nvm version) != "system" ]]; then
          echo "($(nvm version | cut -c2-)) "
        fi
    fi
}
export PS1='%{$fg_bold[green]%}*%{$reset_color%} $(nvm_prompt_version)%{$fg_bold[blue]%}%2~%{$reset_color%} $(my_git_prompt_info)%{$reset_color%}%B»%b '

fpath=(/usr/local/share/zsh-completions $fpath)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
fi

# This loads nvm bash_completion
  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"


  # place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Wasmer
export WASMER_DIR="$HOME/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
export PATH="/usr/local/sbin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#Rust Packagemanager Cargo
source $HOME/.cargo/env

# ZSH plugin manager zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Let zplug manage itself like other packages
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# oh-My-Zsh core
# zplug "lib/*", from:oh-my-zsh

#Extra
zplug "lukechilds/zsh-better-npm-completion", defer:2
zplug "webyneter/docker-aliases", use:docker-aliases.plugin.zsh

# Dotfiles
zplug "$SUPERCHARGED/local", from:local
zplug "$SUPERCHARGED/custom", from:local

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load



