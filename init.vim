" ===
" ===Auto load for first time user
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync 
endif

if has("gui_running")
    set guifont=SourceCodeProBoldforPowerline:h16:b
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-scripts/indentpython.vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/indentLine'

call plug#end()

" enable powerline fonts
" let g:airline_powerline_fonts = 1

" deoplete
let g:deoplete#enable_at_startup=1
inoremap <expr><tab> pumvisible() ? "\<c-p>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set splitbelow

" vim-highlightedyank
hi HighlightedyankRegion cterm=reverse gui=reverse
let g:highlightedyank_highlight_duration = 2000 

" NERDTree
map tt :NERDTree<CR>
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeShowHidden=1
let g:NERDTreeChDirMod=2

" NERDCommenter
let g:NERDSpaceDelims=1
let g:NERDTrimTrailingWhitespace=1
let g:NERDToggleCheckAllLines=1
let g:NERDCommentEmptyLines=1

set nu
set cul
" set cuc
set nowrap
set ignorecase
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set cc=80
set scrolloff=6
set ruler
set autoindent
set smartindent
set incsearch
set clipboard+=unnamed
" set paste
set vb t_vb=

" Show the statusline
set laststatus=2

filetype on
filetype plugin on
filetype plugin indent on

let mapleader = ';'
vmap <Leader>y :w !pbcopy<CR><CR>
nmap <Leader>y :w !pbcopy<CR><CR>
nmap <Leader>p :r !pbpaste<CR><CR>

nnoremap J 4j
nnoremap K 4k
nnoremap U <C-r>
nnoremap <C-j> :m .+1<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-k> :m '<-2<CR>gv=gv

" colorscheme gruvbox

" let g:python3_host_prog="/bin/python3"
