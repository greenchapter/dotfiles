# restyle the zsh prompt
e='\033'
BOLD="${e}[1m"
function nvm_prompt_version {
    if which nvm &> /dev/null; then
        if [[ $(nvm version) != "system" ]]; then
          echo -e "${BOLD}($(nvm version | cut -c2-))${RESET} "
        fi
    fi
}

# deactivate NVM lazy loading
export NVM_LAZY_LOAD=false

# This loads nvm bash_completion
  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

alias system="nvm use system"

