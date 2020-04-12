syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set shell=/bin/sh
set nocompatible
set mouse=a
set encoding=utf-8
set expandtab
set tabstop=4
set shiftwidth=2
set softtabstop=4
set ignorecase
set scrolloff=5
set tw=0
set ruler
set cc=80
set indentexpr=
set backspace=indent,eol,start
set laststatus=2
set autochdir
set number
set norelativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set incsearch
set hlsearch
set noswapfile
set nobackup
"set foldmethod=indent
let &t_ut=' '
au BufReadPost * if line("'\'") > 1 && line("'\'") <= line("$") | exe "normal! g'\"" | endif



map so :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map su :set nosplitlow<CR>:split<CR>
map sj :set splitlow<CR>:split<CR>

map wl <C-w>l
map wk <C-w>k
map wh <C-w>h
map wj <C-w>j

nmap J 4j
nmap K 4k
nmap U <C-r> 
nnoremap <C-j> :m .+1<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-k> :m '<-2<CR>gv=gv



if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'dracula/vim',{'as':'dracula'}

Plug 'ervandew/supertab'

Plug 'vim-airline/vim-airline'

"Plug 'ycm-core/YouCompleteMe'

call plug#end()

" set ervandew supertab mapping <Cr>
let g:SuperTabCrMapping = 1


colorscheme dracula

