set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
let NERDTreeShowHidden=1

syntax on
set expandtab
set tabstop=4
set nu
set ruler
set mouse=a
set list

colorscheme wombat256mod

set autoread                " Automatically reload files changed outside vim
set backup                  " Create backup files
set backupdir=~/.vim/backup " Store backups in specific directory
set directory=~/.vim/swap   " Store swap files in specific directory
set undofile                " Persistent undo across sessions
set undodir=~/.vim/undo     " Store undo files in specific directory

set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch
" Ignore capital letters during search.
set ignorecase
" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

autocmd VimEnter * NERDTree | wincmd p
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif