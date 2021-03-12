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
Plug 'arcticicestudio/nord-vim'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'rust-lang/rust.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
call plug#end()

" Set Plugins
autocmd VimEnter * NERDTree | wincmd p
set timeoutlen=500
set pyx=3
filetype plugin indent on
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 1
let g:mkdp_browser = '/usr/bin/firefox-developer-edition'
let g:mkdp_page_title = '「${name}」'
let g:python3_host_prog = 1
let g:coc_watch_extensions = 1

" Set Display
set number
set hidden
set mouse=a
set tabstop=4
set shiftwidth=4
set cursorline
set cursorcolumn
set encoding=UTF-8
set smartcase
set spell spelllang=en_us

" Set Color Theme
syntax on
set background=dark
if has('termguicolors')
set termguicolors
endif

let g:airline_theme = 'nord'
let g:airline#extensions#tabline#enabled = 1

colorscheme nord

" Set Key map
set timeoutlen=500
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
let mapleader = " "
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:leader_key_map = {}
let g:leader_key_map['w'] = {
    \ 'name' : 'Windows' ,
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
    \ 'name' : 'File'                                ,
    \ 'q' : [':q' , 'close-file']                    ,
    \ 'Q' : [':q!' , 'close-abandon-changes']        ,
    \ 'w' : [':w' , 'save-file']                     ,
    \ 'x' : [':x' , 'save-and-close']                ,
    \ 'm' : [':e $MYVIMRC' , 'edit-config']          ,
    \ }

let g:leader_key_map['e'] = {
    \ 'name' : 'Edit' ,
    \ 'x'  : ['' , 'delete-character']                  ,
    \ 'dd' : ['' , 'delete-line-(cut)']                 ,
    \ 'yy' : ['' , 'yank-line-(copy)']                  ,
    \ 'p'  : ['' , 'paste']                             ,
    \ 'P'  : ['' , 'paste-before']                      ,
    \ '"*p': ['' , 'paste-from-system-clipboard']       ,
    \ '"*y': ['' , 'paste-to-system-clipboard']         ,
    \ 'a'  : ['' , 'append']                            ,
    \ 'A'  : ['' , 'append-from-the-end-of-line']       ,
    \ 'i'  : ['' , 'insert']                            ,
    \ 'o'  : ['' , 'next-line']                         ,
    \ 'O'  : ['' , 'previous-line']                     ,
    \ 's'  : ['' , 'delete-char-and-insert']            ,
    \ 'S'  : ['' , 'delete-line-and-insert']            ,
    \ 'C'  : ['' , 'delete-until-end-line-and-insert']  ,
    \ 'r'  : ['' , 'replace-one-character']             ,
    \ 'R'  : ['' , 'enter-replace-mode']                ,
    \ 'u'  : [':undo' , 'undo-changes']                 ,
    \ 'U'  : ['<C-R>' , 'redo-changes']                 ,
    \ }

let g:leader_key_map['v'] = {
    \ 'name' : 'VisualMode'                         ,
    \ 'v'   : ['' , 'enter-visual-mode']            ,
    \ 'V'   : ['' , 'enter-visual-line-mode']       ,
    \ 'B'   : ['<C-V>' , 'enter-visual-block-mode'] ,
    \ 'd'   : ['' , 'delete-selection']             ,
    \ 's'   : ['' , 'replace-selection']            ,
    \ 'y'   : ['' , 'yank-selection-(copy)']        ,
    \ 'c'   : ['' , 'change']                       ,
    \ '>'   : ['' , 'indent-right']                 ,
    \ '<'   : ['' , 'indent-lef']                   ,
    \ '='   : ['' , 'auto-indent']                  ,
    \ 'g~'  : ['' , 'swap-case']                    ,
    \ 'gU'  : ['' , 'upper-case']                   ,
    \ 'gu'  : ['' , 'low-case']                     ,
    \ '!'   : ['' , 'filter-(external-program)']    ,
    \ 'dd'  : ['' , 'delete-current-line']          ,
    \ 'dw'  : ['' , 'delete-to-next-word']          ,
    \ 'db'  : ['' , 'delete-the-beginning-word']    ,
    \ 'ndd' : ['' , 'delete-n-lines']               ,
    \ 'dip' : ['' , 'delete-inside-paragraph']      ,
    \ }

let g:leader_key_map['n'] = {
    \ 'name' : 'Navigating'                            ,
    \ 'h'  : ['' , 'left']                             ,
    \ 'j'  : ['' , 'up']                               ,
    \ 'k'  : ['' , 'down']                             ,
    \ 'l'  : ['' , 'right']                            ,
    \ 'U'  : ['<C-U>' , 'half-page-up']                ,
    \ 'D'  : ['<C-D>' , 'half-page-down']              ,
    \ 'B'  : ['<C-B>' , 'page-up']                     ,
    \ 'F'  : ['<C-F>' , 'page-down']                   ,
    \ 'b'  : ['' , 'previous-word']                    ,
    \ 'w'  : ['' , 'next-word']                        ,
    \ 'ge' : ['', 'previous-end-of-word']              ,
    \ '0'  : ['' , 'start-of-line']                    ,
    \ '^'  : ['' , 'start-of-line-after-whitespace']   ,
    \ '$'  : ['' , 'end-of-line']                      ,
    \ 'fc' : ['' , 'go-forward-to-character']          ,
    \ 'Fc' : ['' , 'go-backward-to-character']         ,
    \ 'gg' : ['' , 'first-line']                       ,
    \ 'G'  : ['' , 'last-line']                        ,
    \ ':n' : ['' , 'go-to-line-n']                     ,
    \ 'nG' : ['' , 'go-to-line-n']                     ,
    \ 'zz' : ['' , 'center-this-line']                 ,
    \ 'zt' : ['' , 'top-this-line']                    ,
    \ 'zb' : ['' , 'bot-tom-this-line']                ,
    \ 'H'  : ['' , 'move-to-top-of-screen']            ,
    \ 'M'  : ['' , 'move-to-middle-of-screen']         ,
    \ 'L'  : ['' , 'move-to-bottom-of-screen']         ,
    \ 'n'  : ['' , 'next-matching-search-pattern']     ,
    \ 'N'  : ['' , 'previous-match']                   ,
    \ '*'  : ['' , 'next-whole-word-under-cursor']     ,
    \ '#'  : ['' , 'previous-whole-word-under-cursor'] ,
    \ }

function! _input_name()
    call inputsave()
    let name = input("File Name: ")
    call inputrestore()

    return name
endfunction

function! _new_tab()
    exec ":tabedit " _input_name()
endfunction

function! _find_tab()
    exec ":tabfind " _input_name()
endfunction

let g:leader_key_map['t'] = {
    \ 'name' : 'TabPages'                                            ,
    \ 'e' : [':call _new_tab()' , 'edit-file-in-a-new-tab']          ,
    \ 'f' : [':call _find_tab()' , 'open-file-if-exists-in-new-tab'] ,
    \ 'q' : [':tabclose' , 'close-current-tab']                      ,
    \ 'l' : [':tabs' , 'list-all-tabs']                              ,
    \ 'g' : [':tabfirst' , 'go-to-first-tab']                        ,
    \ 'G' : [':tablast' , 'go-to-last-tab']                          ,
    \ 'n' : [':tabn' , 'go-to-next-tab']                             ,
    \ 'N' : [':tabp' , 'go-to-previous-tab']                         ,
    \ }

let g:leader_key_map['o'] = {
    \ 'name' : 'TextObject'             ,
    \ 'p'    : ['' , 'paragraph']       ,
    \ 'w'    : ['' , 'word']            ,
    \ 's'    : ['' , 'sentence']        ,
    \ '[({<' : ['' , 'a-block']         ,
    \ 'b'    : ['' , 'a-block-[(']      ,
    \ 'B'    : ['' , 'a-block-in-[{']   ,
    \ 't'    : ['' , 'a-xml-tag-block'] ,
    \ }

autocmd! User vim-which-key call which_key#register('<Space>', 'g:leader_key_map')
