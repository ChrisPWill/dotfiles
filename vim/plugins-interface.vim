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
