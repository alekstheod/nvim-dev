call plug#begin('~/.config/nvim/plugged')
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-rooter'
" bazel
Plug 'bazelbuild/vim-bazel'
Plug 'google/vim-glaive'
Plug 'google/vim-maktaba'
Plug 'sheerun/vim-polyglot'
Plug 'cj/vim-webdevicons'
Plug 'ekalinin/Dockerfile.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'luochen1990/rainbow'
Plug 'dag/vim-fish'
Plug 'mechatroner/rainbow_csv'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'powerline/powerline'
Plug 'preservim/nerdtree'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-obsession'
Plug 'dracula/vim'
Plug 'maxbrunsfeld/vim-yankstack'
"vim-lsp-settings
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'lifepillar/vim-mucomplete'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'lighttiger2505/deoplete-vim-lsp'
"CoC
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/vim-easy-align'
call plug#end()

"easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let g:rainbow_active = 1
let g:rooter_patterns = ['Rakefile']

"mkdown
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1

let mapleader=" "

set mouse=n
filetype plugin on

syntax on

set noautochdir

" Required for operations modifying multiple buffers like rename.
set hidden

:runtime cpp.vim
":runtime coc.vim
:runtime fzf.vim
:runtime nerdtree.vim
:runtime lsp.vim
:runtime bindings.vim
:runtime style.vim
:runtime custom.vim
:runtime autoformat.vim
