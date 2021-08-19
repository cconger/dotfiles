filetype off

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'fatih/vim-go', { 'do' : ':GoUpdateBinaries' }
Plug 'scrooloose/nerdtree'
Plug 'jparise/vim-graphql'
Plug 'neovim/nvim-lspconfig'

call plug#end()

lua require('setup_lsp')

filetype plugin indent on

let NERDTreeShowHidden = 1
set backspace=2

syntax on

set shortmess+=r

set showmode
set showcmd

set shiftwidth=2
set tabstop=2
set shiftround
set expandtab
set autoindent

set wrap
set ruler

set showmatch

set formatoptions-=t
set textwidth=109

set scrolloff=10

set hls
set incsearch

set backupdir=~/.tmp
set dir=~/.tmp/swap

map <C-p> :FZF<CR>

if (has("termguicolors"))
	set termguicolors
endif

let g:lightline = { 'colorscheme': 'gruvbox' }
colorscheme gruvbox

set number relativenumber

highlight Search ctermbg=5 ctermfg=0
highlight StatusLine ctermbg=5
highlight StatusLine ctermfg=0
highlight StatusLineNC ctermbg=4
highlight StatusLineNC ctermfg=3
highlight VertSplit ctermbg=NONE ctermfg=15
highlight CursorLine ctermbg=0
highlight LineNr ctermbg=NONE

autocmd FileType yaml setlocal ts=2 sw=2 expandtab
autocmd FileType yaml let g:indentLine_char = '⦙'

