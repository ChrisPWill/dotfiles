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
" vim-airline
Plugin 'bling/vim-airline'
" Parenthesis matching for HTML tags
" Plugin 'gregsexton/MatchTag'
" vimwiki
Plugin 'vimwiki'
" Buffergator
Plugin 'jeetsukumaran/vim-buffergator'
" YCM
Plugin 'Valloric/YouCompleteMe'
" Buffergator
Plugin 'jeetsukumaran/vim-buffergator'
" Show vim undo tree in a window
Plugin 'mbbill/undotree'
" Like CtrlP but better
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
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
let g:ycm_confirm_extra_conf = 0


map <C-n> :NERDTreeToggle<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
nnoremap <C-t> :Files<CR>

"html tidy
:vmap ,x :!tidy -q -i --show-errors 0<CR>

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

"Make airline appear always
set laststatus=2

set mouse=a

" Keep buffers (including edited ones) open in background
:set hidden

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Rebind pymode breakpoint key
let g:pymode_breakpoint_bind = '<leader>p'
let g:syntastic_cpp_checkers=['']

set pastetoggle=<F2>

" Rebind pymode breakpoint key
let g:pymode_breakpoint_bind = '<leader>p'

" eslint
let g:syntastic_javascript_checkers = ['eslint']

set backupcopy=yes
