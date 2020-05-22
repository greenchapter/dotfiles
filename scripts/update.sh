#!/usr/bin/env zsh

trap on_error SIGKILL SIGTERM

e='\033'
RESET="${e}[0m"
BOLD="${e}[1m"
CYAN="${e}[0;96m"
RED="${e}[0;91m"
YELLOW="${e}[0;93m"
GREEN="${e}[0;92m"
ORANGE="${e}[0;33m"
PURPLE="${e}[0;34m"

_exists() {
  command -v $1 > /dev/null 2>&1
}

# Success reporter
info() {
  echo -e "\n ⏺  ${*}${RESET}\n"
}

show() {
  echo -e "${*}"
}

# Error reporter
error() {
  echo -e "${RED}${*}${RESET}\n"
}

# Success reporter
success() {
  echo -e "\n ✳️  ${GREEN}${*}${RESET}\n"
}

bye() {
  echo -e "\n 💟 ${PURPLE}${*}${RESET}\n"
}

# End section
finish() {
  success ${*}
  echo
  sleep 1
}

# Set directory
export DOTFILES=${1:-"$HOME/.dotfiles"}

on_start() {
  show '                                                '
  show '              by @greenchapter                   '
  show '                                                '
}

update_dotfiles() {
  info "Updating dotfiles..."

  cd $DOTFILES
  git pull github master
  cd - > /dev/null 2>&1

  finish "Yeww! You have updated the dotfiles."

  info "Updating zplug packages..."

  zplug clean --force
  zplug clear
  zplug update

  finish "All zplug packages are up to date."
}

update_brew() {
  if ! _exists brew; then
    return
  fi

  info "Updating Homebrew..."

  brew update
  brew upgrade
  brew cleanup

  finish "All brew kegs are updated"
}

update_npm() {
  if ! _exists npm; then
    return
  fi

  info "Updating NPM..."

  NPM_PERMS="$(ls -l $(npm config get prefix)/bin \
    | awk 'NR>1{print $3}' \
    | grep "$(whoami)" \
    | uniq)"

  if [[ "$NPM_PERMS" == "$(whoami)" ]]; then
    npm-check -gu
  else
    error "Permissions needed!"
    echo "Better to fix your permissions. Read more:"
    echo "\t <https://docs.npmjs.com/getting-started/fixing-npm-permissions>"
    echo
    echo "The script will ask you the password for sudo:"
    sudo npm install npm -g
  fi

  finish "All NPM Modules are updated"
}


on_finish() {
  bye "Happy Coding!"
  # echo
  # echo -ne $RED'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  # echo -e  $RESET$BOLD',------,'$RESET
  # echo -ne $YELLOW'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  # echo -e  $RESET$BOLD'|   /\_/\\'$RESET
  # echo -ne $GREEN'-_-_-_-_-_-_-_-_-_-_-_-_-_-'
  # echo -e  $RESET$BOLD'~|__( ^ .^)'$RESET
  # echo -ne $CYAN'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  # echo -e  $RESET$BOLD'""  ""'$RESET
  # echo
}

on_error() {
  error "Wow... Something serious happened!"
  error "There was an error updating. Try again later?"
  exit 1
}

main() {
  on_start "$*"
  update_dotfiles "$*"
  update_brew "$*"
  update_npm "$*"
  on_finish "$*"
}

main "$*"
