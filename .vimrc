filetype off

call plug#begin('~/.vim/plugged')

"Plugin 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'morhetz/gruvbox'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'Quramy/tsuquyomi'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'cespare/vim-toml'
Plug 'hashivim/vim-terraform'
Plug 'w0rp/ale'

call plug#end() 
filetype plugin indent on

let g:ale_linters = {
      \ 'python': ['pylint', 'flake8']
      \}

let g:ale_fixers = {
      \ 'python': ['autopep8'] 
      \}

let NERDTreeShowHidden = 1

set backspace=2

" have command-line completeion <Tab> first list the available options and complete the longest common part
" then have further <Tab>s cycle through the possiilities:
set wildmode=list:longest,full

syntax on

" use "[RO]" "[readonly]" to save space in the message line:
set shortmess+=r

"display the ucrrent mode and partially typed commands in the status line:
set showmode
set showcmd

"Indenting is 2 spaces and copy to next line
set shiftwidth=2
set tabstop=2
set shiftround
set expandtab
set autoindent

set wrap
set ruler

" Show matching brackets
set showmatch

"109 line limit for Comments
set formatoptions-=t
set textwidth=109

set scrolloff=10

"Search
set hls
set incsearch

"Enable Filetype detection
filetype on

set smartindent

set backupdir=~/.tmp
set dir=~/.tmp/swap

"FZF fuzzy finder: https://github.com/junegunn/fzf
set rtp+=/usr/local/opt/fzf
map <C-p> :FZF<CR>

if (has("termguicolors"))
  set termguicolors
endif

let g:lightline = { 'colorshcmee': 'gruvbox' }
colorscheme gruvbox

set number
"set cursorline
"hi LineNr ctermfg=blue
"hi CursorLineNr ctermfg=red
"au BufLeave * :set nonumber
"au BufEnter * :set number

filetype indent on

highlight Search ctermbg=5 ctermfg=0
highlight StatusLine ctermbg=5
highlight StatusLine ctermfg=0
highlight StatusLineNC ctermbg=4
highlight StatusLineNC ctermfg=3
highlight VertSplit ctermbg=NONE ctermfg=15
highlight CursorLine ctermbg=0
highlight LineNr ctermbg=NONE

