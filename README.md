# My Supercharged Dotfiles

See here all my used dotfiles

to update these dotfiles use `upgrade_supercharged` on the command line.

## Install

On a fresh install of macOS, run:

```
sudo softwareupdate -i -a
xcode-select --install
```

Then clone the repo and run `scripts/setup.sh`:

```
git clone https://github.com/greenchapter/dotfiles ~/.dotfiles
source ~/.dotfiles/scripts/setup.sh
```

#### oh-my-zsh

```
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

#### Alias Table

| Alias                  | Description                                          |
| ---------------------- | ---------------------------------------------------- |
| **zshconfig**          | open oh-my-zsh main configuration in sublime         |
| **tconfig**            | open tmux configuration in sublime                   |
| **password**           | generate a random password                           |
| **preview**            | open a fuzzy search with bat                         |
| **edit**               | open a fuzzy search and edit with sublime            |
| **l**                  | list in table                                        |
| **ll**                 | list in row                                          |
| **le**                 | list in table with exa                               |
| **lle**                | list in tree with exa                                |
| **zshreload**          | reload zsh shell                                     |
| **upgrade_global_npm** | switch nvm enviroment and update global npm packages |

## Sublime Text 3

## Terminal

The Supercharged Pro Theme use the font **Source Code Pro Powerline** Font, you will get the font here → https://github.com/powerline/fonts

## tmux

The fully supported usage of tmux need to install the homebrew package **reattach-to-user-namespace** `brew install reattach-to-user-namespace`.

The config file is inspired by [Monorkins](https://github.com/monorkin) [tmux configuration](https://github.com/monorkin/dotfiles/blob/417fd14199a7470c5e924c0f5567b3987632047c/tmux.conf)😘

## fzf

For full fzf install run `$(brew --prefix)/opt/fzf/install`

Here some **special commands**

- Reload Configuration with \*prefix C-b **r\***

## VSCode

Generate extension list `code --list-extensions > extensions` 

Create Settings link `ln -s ~/.dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User`

## Vim

Vim uses the plug-in manager [vundle](https://github.com/VundleVim/Vundle.vim)

to install all supercarged vim plugins run `:PluginInstall` via Vim. `:PluginInstall` is for keeping up-to-date with the installed Vim plugins.

##### WebAssembly Command Line Support

My dotfiles support wasmer binaries via CLI → [https://wasmer.io/](https://wasmer.io/)
