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

" Make airline appear always
set laststatus=2
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

let $FZF_DEFAULT_COMMAND = 'rg -l ""'

nnoremap <C-t> :Files<CR>
