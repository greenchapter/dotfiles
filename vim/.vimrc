set nocompatible
set encoding=utf-8 nobomb
filetype off

set ttimeout
set ttimeoutlen=50
set timeoutlen=3000

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
set guioptions=
set backspace=indent,eol,start


call plug#begin()

Plug 'dracula/vim'
Plug 'othree/yajs.vim'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'lervag/vimtex'
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'

call plug#end()

filetype plugin indent on

set ruler
set number
syntax enable
colorscheme dracula
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set noshowmode
set laststatus=2
set linespace=4
let g:airline_powerline_fonts=1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_skip_empty_sections=1
set tw=100
set formatoptions+=t
set ignorecase
set incsearch
set title
set nostartofline
set showcmd
set nostartofline
set noeol
set scrolloff=3
set cul
set mouse=a
autocmd InsertEnter,InsertLeave * set nocul!
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_list_hide='.*\.swp$,\~$,\.orig$'
let g:NERDTreeShowHidden=1

" workaround for the jumping cmd menu in macvim, described here https://github.com/preservim/nerdtree/issues/1321#issuecomment-1234980190
let g:NERDTreeMinimalMenu=1
inoremap <C-c> <Esc><Esc>
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
:autocmd BufNewFile *.html 0r ~/.vim/templates/html.tpl

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
