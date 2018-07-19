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
" fzf
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" vim fugitive
Plugin 'tpope/vim-fugitive'

" Make airline appear always
set laststatus=2
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

let $FZF_DEFAULT_COMMAND = 'rg -l ""'

nnoremap <C-t> :Files<CR>

hi DiffAdd      cterm=none    ctermfg=NONE      ctermbg=NONE
hi DiffChange   cterm=none    ctermfg=NONE      ctermbg=NONE
hi DiffDelete   cterm=none    ctermfg=NONE      ctermbg=NONE
hi DiffText     cterm=none    ctermfg=NONE      ctermbg=NONE
" =============================================
" Language specific plugins and syntax checking
" =============================================

" Syntastic
Plugin 'scrooloose/syntastic'
" Rust syntax highlighting
Plugin 'rust-lang/rust.vim'
" Project settings for editors
Plugin 'editorconfig/editorconfig-vim'

" Language client
Plugin 'autozimu/LanguageClient-neovim'

" Code completion
Plugin 'shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1
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

