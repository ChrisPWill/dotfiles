set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Nerd Tree
Plugin 'scrooloose/nerdtree'
" Syntastic
Plugin 'scrooloose/syntastic'
" Solarized colour
Plugin 'altercation/vim-colors-solarized'
" Improved Javascript
Plugin 'pangloss/vim-javascript'
" YCM
Plugin 'Valloric/YouCompleteMe'
" Indent guides
Plugin 'nathanaelkane/vim-indent-guides'
" Git wrapper
Plugin 'tpope/vim-fugitive'
" Sudo
Plugin 'sudo.vim'
" vimproc
Plugin 'Shougo/vimproc.vim'
" ghcmod for Haskell
" Plugin 'eagletmt/ghcmod-vim'
" python-mode
Plugin 'klen/python-mode'
" CTRL-P
Plugin 'kien/ctrlp.vim'
" Rust support
Plugin 'wting/rust.vim'
" color (\<F2>)
Plugin 'vim-scripts/hexHighlight.vim'
" other color schemes
Plugin 'flazz/vim-colorschemes'
Plugin 'lilydjwg/colorizer'
"Plugin 'file:///home/chris/chris/.vim/bundle/chris'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable
if has('gui_running')
    colorscheme solarized
else
    colorscheme bclear
endif
set background=dark

" Disable autocompletion for python-mode (already using YCM)
let g:pymode_rope_completion = 0


map <C-n> :NERDTreeToggle<CR>

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
