" vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'lervag/vimtex'
Plug 'lervag/vimtex', { 'tag': 'v2.15' }
call plug#end()

" Settings
let mapleader = " "
set nu rnu
filetype plugin indent on
syntax enable
set expandtab
set tabstop=4
set shiftwidth=4
set colorcolumn=80
