syntax on
set number relativenumber

if &diff
	colorscheme angr
else
	colorscheme dracula
endif

"general
set guifont=Monoid-Retina:12
set termguicolors
set wrap!

"airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 1
let g:airline_theme="minimalist"

set nu rnu
set encoding=utf-8
set shiftwidth=4
set tabstop=4
set incsearch
