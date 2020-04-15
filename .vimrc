syntax on

if empty(glob('~/.vim/autoload/onedark.vim'))
  silent !curl -fLo ~/.vim/autoload/onedark.vim --create-dirs
    \ https://raw.githubusercontent.com/joshdick/onedark.vim/master/autoload/onedark.vim
  silent !curl -fLo ~/.vim/colors/onedark.vim --create-dirs
    \ https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim
endif


colorscheme onedark

" 自动安装Plug插件管理器
" see: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
call plug#end()


set number
" 突出显示当前行 
set cursorline
" 显示当前光标所在的列 
" set cursorcolumn

" 显示匹配的括号 
set showmatch
" Tab长度为4空格 
set tabstop=4
" 自动缩进长度4空格 
set shiftwidth=4
" Tab扩展为空格
set expandtab
" 继承前一行的缩进 
set autoindent
" 避免粘贴时缩进错误 
"set paste
" 显示空格和tab 
set listchars=tab:>-,trail:-
" 显示状态栏 
set laststatus=2
" 显示光标当前位置 
set ruler