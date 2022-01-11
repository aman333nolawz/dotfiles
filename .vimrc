set number
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set termguicolors
set noshowmode
set smartcase
set mouse=a
set incsearch
set scrolloff=10
set completeopt=menuone,noinsert,noselect
set wildmode=list

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'
Plug 'luochen1990/rainbow'

call plug#end()

colorscheme dracula

let g:airline_theme='term'
let g:rainbow_active = 1

