set nocompatible

call plug#begin('~/.config/nvim/plugged')

" Appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'overcache/NeoSolarized'
Plug 'jacoborus/tender.vim'
Plug 'kovetskiy/sxhkd-vim'
Plug 'dylanaraps/wal.vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""
""                 User config                ""
""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set nobackup
set nowritebackup
set hidden
set number relativenumber
set tabstop=4 shiftwidth=4 expandtab
set smartindent
set smartcase
set noswapfile
set cmdheight=2
set colorcolumn=79
set updatetime=300
set shortmess+=c
set signcolumn=yes
set encoding=UTF-8

" Theme
"colorscheme onedark
colorscheme wal

let g:airline_theme='onedark'
hi Normal guibg=NONE ctermbg=NONE

"AirlineTheme nord

" Enable true colors
"set termguicolors

""""""""""""""""""""""""""""""""""""""""""""""""
""                Key bindings                ""
""""""""""""""""""""""""""""""""""""""""""""""""

"" Windows navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

""""""""""""""""""""""""""""""""""""""""""""""""
""                Plug-in config              ""
""""""""""""""""""""""""""""""""""""""""""""""""

"" Tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
