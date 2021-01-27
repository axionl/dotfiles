" Install Plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'sheerun/vim-polyglot'
    Plug 'ryanoasis/vim-devicons'
    Plug 'Yggdroot/indentLine'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree'
    Plug 'sainnhe/sonokai'
    Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
    Plug 'rust-lang/rust.vim'
call plug#end()

" Set Plugins
autocmd VimEnter * NERDTree | wincmd p
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set timeoutlen=500
filetype plugin indent on

" Set Display
set number
set hidden
set mouse=a
set cursorline
set cursorcolumn
set encoding=UTF-8
set smartcase

" Set Color Theme
syntax on
set background=dark
if has('termguicolors')
    set termguicolors
endif

let g:sonokai_style = 'maia'
let g:sonokai_enable_italic = 1
let g:sonokai_transpartent_background = 1
let g:sonokai_better_performance = 1
let g:sonokai_current_word = 'bold'
let g:airline_theme = 'sonokai'
let g:airline#extensions#tabline#enabled = 1

colorscheme sonokai

" Set Key map
set timeoutlen=500
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:leader_key_map = {}
let g:leader_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5' , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5' , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }

let g:leader_key_map['f'] = {
      \ 'name' : '+file'                        ,
      \ 'n' : 'new-file'                        ,
      \ 'q' : [':q'  , 'close-file']            ,
      \ 'Q' : [':q!' , 'close-abandon-changes'] ,
      \ 'w' : [':w'  , 'save-file']             ,
      \ 'x' : [':x'  , 'save-and-close']        ,
      \ 'm' : [':e $MYVIMRC', 'edit-config']    ,
      \ }

autocmd! User vim-which-key call which_key#register('<Space>', 'g:leader_key_map')
