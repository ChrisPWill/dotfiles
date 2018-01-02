set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ==========================
" Interface specific plugins 
" ==========================

" Nerd Tree
Plugin 'scrooloose/nerdtree'
" vim-airline
Plugin 'bling/vim-airline'
" YCM
Plugin 'Valloric/YouCompleteMe'
" fzf
Plugin 'junegunn/fzf'

" Make airline appear always
set laststatus=2
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" =============================================
" Language specific plugins and syntax checking
" =============================================

" Syntastic
Plugin 'scrooloose/syntastic'
" python-mode
Plugin 'klen/python-mode'
" Rust syntax highlighting
Plugin 'rust-lang/rust.vim'
" Project settings for editors
Plugin 'editorconfig/editorconfig-vim'
" All of Plugins must be added before the following lines
call vundle#end()
filetype plugin indent on

syntax on
set background=dark
filetype indent plugin on

set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4

set mouse=a

