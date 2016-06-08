set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"{{{ Vundle Bundles!
if exists(':Bundle')
    Bundle 'Syntastic'
"    Bundle 'joonty/vim-phpqa.git'
    Bundle "scrooloose/nerdtree"
    Bundle "jistr/vim-nerdtree-tabs"
    Bundle "benmills/vimux"
    Bundle "bling/vim-airline"
end
"}}}

set tabstop=4       " numbers of spaces of tab character
set number          " show line numbers
set expandtab      " tabs are converted to spaces, use only when required
syntax on           " syntax highlighing

set wildmenu
set showcmd
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" auto indent as current line
set autoindent

" <leader> is , instead of \
let mapleader = ","

" Map to avoid hold shift to every command
nnoremap ; :

" Edit a write protected file after open
cmap w!! w !sudo tee % >/dev/null

let php_short_tags = 0
let g:phpqa_codesniffer_args = "--standard=PSR2"

" airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" ===============================================================
" Navigation Stuff

" Window navigation
nnoremap <leader>\| <c-w>v<c-w>l
nnoremap <leader>- <c-w>s<c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Resize windows
nnoremap <c-b> 5<c-w><
nnoremap <c-n> 5<c-w>>

nnoremap + 5<c-w>+
nnoremap _ 5<c-w>-

" Tab navigation
map <F2> :NERDTreeToggle<cr>
nnoremap <s-l> :bnext<cr>
nnoremap <s-h> :bprevious<cr>
nnoremap <s-n> :tabnew<cr>


nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" ===============================================================
