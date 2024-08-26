" Plugins will be downloaded under the specified directory.
call plug#begin(has('vim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'ghifarit53/tokyonight-vim'

" nnoremap <silent> <leader> :WhichKey '<space>'<CR>

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).






" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set termguicolors
" Set block cursor in normal mode
let &t_EI = "\e[2 q"

" Set line cursor in insert mode
let &t_SI = "\e[6 q"

set number
set clipboard=unnamedplus
set background=light
" let g:embark_terminal_italics = 1
" colorscheme embark

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" let g:mapleader = '\<Space>'

let g:maplocalleader = 'm'
map <leader>ct :colorscheme 

" To register the descriptions when using the on-demand load feature,
" use the autocmd hook to call which_key#register(), e.g., register for the Space key:
" autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

"

" nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

set timeout=500
