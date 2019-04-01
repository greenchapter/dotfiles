set nocompatible
set encoding=utf-8 nobomb
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'dracula/vim'
Plugin 'othree/yajs.vim'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'lervag/vimtex'
Plugin 'airblade/vim-gitgutter'

call vundle#end()

filetype plugin indent on

set ruler
set number
syntax enable
set guifont=Source\ Code\ Pro\ for\ Powerline:h12
set background=dark
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
inoremap <C-c> <Esc><Esc>
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
:autocmd BufNewFile *.html 0r ~/.vim/templates/html.tpl
