set nocompatible

syntax on

if empty(glob('~/.vim/autoload/onedark.vim'))
    silent !curl -fLo ~/.vim/autoload/onedark.vim --create-dirs
                \ https://raw.githubusercontent.com/joshdick/onedark.vim/master/autoload/onedark.vim
    silent !curl -fLo ~/.vim/colors/onedark.vim --create-dirs
                \ https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim
endif


colorscheme onedark

" Show line numbers
set number

" Show current line 
set cursorline

" Show current column - not recommended 
" set cursorcolumn

" Show matching bracket
set showmatch

" Set tab to 4 spaces 
set tabstop=4

" Set indent to 4 spaces 
set shiftwidth=4

" Expand tab to spaces
set expandtab

" Inherit indents 
set autoindent

" Avoid incorrect indents while pasting - not recommended
" if you believe it useful, try:
" 1. open it manually by `:set paste`, and close with `:set nopaste`
" 2. try `gg=G`, this will format your whole file.
"set paste

" Show tabs and spaces 
set list
set listchars=tab:>·,space:·

" Show status bar 
set laststatus=2

" Show current cursor 
set ruler

" Do not clear screen on exist
set t_ti= t_te=


" Use Ctrl + H/J/K/L to switch between windows
" If you use vim-terminals, refer to https://www.zhihu.com/question/278228687/answer/413375553
noremap <C-H> :wincmd h<CR>
noremap <C-L> :wincmd l<CR>
noremap <C-J> :wincmd j<CR>
noremap <C-K> :wincmd k<CR>


" ======= Plug install and settings with Vim-Plug ======
"
" Install vim-plug and plugins on first start
" see: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
call plug#end()
" ====== Plug install end

" ======= NERDTree config start ========
" Open NERDTree on vim start
autocmd VimEnter * NERDTree
autocmd StdinReadPre * let s:std_in=1
" Open NERDTree with `vim`
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open NERDTree with `vim <dir>`
autocmd VIMEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_id") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Auto close if only NERDTree left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDTree arrows
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeShowHidden=1

" Auto focus main window on launch
augroup NERD
    au!
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
augroup END

" ======= NERDTree config end =======
