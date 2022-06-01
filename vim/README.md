# ✍️ VIM
## Install with `vim-plug`

```bash
ln -s ~/.dotfiles/vim/.vimrc
```

https://github.com/junegunn/vim-plug

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
`:PlugInstall`

## Commands
### Cheatsheet
| Description   |      Command      |
|----------|:-------------:|
| Open a new tab |  `:tabnew` |
| Jump between windows | `^+w` `<cursor>` |
| Delete a file | `:!rm <filename>` |
| Jump between tabs | `gt` |
| Delete line | `dd` |
| Duplicate line | `y` `p` |
| `:e <filename>` | Open new file to edit test |
| `yy` `p` | Duplicate line and insert |
| `<C-m>` | Generate markdown preview with [vim-markdown-preview](https://github.com/JamshedVesuna/vim-markdown-preview) |
| `yy` `p` | Duplicate line and insert |


### NERDTree
| Description   |      Command      |
|----------|:-------------:|
| Open NERDTree |    `:NERDTree`   |

