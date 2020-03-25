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

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

let python_highlight_all=1
syntax on

set splitbelow
set splitright
set number  " Show line numbers
set clipboard^=unnamed,unnamedplus " Universal clipboard
set encoding=utf-8
set tabstop=4

" ----------Plugins----------
" nerdtree
map <C-o> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


" asyncrun
nnoremap <F5> :call <SID>compile_and_run()<CR>

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
       exec "AsyncRun! time python %"
    endif
endfunction

let g:asyncrun_open = 15


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
let g:ale_completion_enabled = 1

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
filetype plugin indent on    " requiredi
