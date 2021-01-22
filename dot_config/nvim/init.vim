" Install Plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'joshdick/onedark.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'ryanoasis/vim-devicons'
    Plug 'Yggdroot/indentLine'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree'
call plug#end()

" Set Plugins
autocmd VimEnter * NERDTree | wincmd p
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Set Display
set number
set mouse=a
set cursorline
set cursorcolumn
set encoding=UTF-8

" Set Color Theme
syntax on
set background=dark
colorscheme onedark
let g:airline_theme = 'onedark'
let g:airline#extensions#tabline#enabled = 1
set termguicolors
