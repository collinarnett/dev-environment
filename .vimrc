set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ----------Vim Config----------

" Language specific variables

autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd FileType python setlocal tabstop=4 shiftwidth=4
autocmd FileType json setlocal tabstop=2 shiftwidth=2
autocmd FileType fish setlocal tabstop=2 shiftwidth=2
autocmd FileType bash setlocal tabstop=2 shiftwidth=2

" Enable folding
set foldmethod=indent
set foldlevel=99

let python_highlight_all=1
syntax on

set splitbelow
set splitright
set number  " Show line numbers
set clipboard^=unnamed,unnamedplus " Universal clipboard
set encoding=utf-8

" ----------Plugins----------
" nerdtree
map <C-o> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" ale
let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\    'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8', 'isort'],
\    'markdown': ['prettier'],
\    'javascript': ['eslint'],
\}
let b:ale_linters = {
\    'python': ['pylint', 'flake8', 'pyls'],
\    'markdown': ['mdl'],
\    'javascript': ['eslint']
\}
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 1

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'w0rp/ale'
Plugin 'tmhedberg/SimpylFold'
Plugin 'godlygeek/tabular'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'Yggdroot/indentLine'
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype off
filetype plugin indent on    " required
