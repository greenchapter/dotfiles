# Set locales
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BAT_PAGER="less -RF"

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
DISABLE_AUTO_UPDATE="true"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

### User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(history-substring-search git sublime vscode git-extras nvm extract last-working-dir npm docker encode64 zsh-autosuggestions zsh-fzf-history-search kubectl)

source $ZSH/oh-my-zsh.sh

source <(kubectl completion zsh)

# restyle the zsh prompt
function nvm_prompt_version {
    if which nvm &> /dev/null; then
        if [[ $(nvm version) != "system" ]]; then
          echo -e "($(nvm version | cut -c2-)) "
        fi
    fi
}

# deactivate NVM lazy loading
export NVM_LAZY_LOAD=false


# SSH private key path
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Add Visual Studio Code to the prompt
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export PS1='%{$fg_bold[green]%}*%{$reset_color%} $(nvm_prompt_version)%{$fg_bold[blue]%}%2~%{$reset_color%} $(my_git_prompt_info)%{$reset_color%}%B»%b '

fpath=(/usr/local/share/zsh-completions $fpath)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Wasmer
export WASMER_DIR="$HOME/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
export PATH="/usr/local/sbin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# Dotfiles
zplug "$SUPERCHARGED/zsh/custom", from:local

# Let zplug manage itself like other packages
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Extra
zplug "lukechilds/zsh-better-npm-completion", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  zplug install
fi

zplug load

# Then, source plugins and add commands to $PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"