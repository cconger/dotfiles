filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"Plugin 'w0rp/ale'
Plugin 'junegunn/fzf'
Plugin 'fatih/vim-go'
Plugin 'chriskempson/base16-vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'cespare/vim-toml'
Plugin 'hashivim/vim-terraform'

call vundle#end() 
filetype plugin indent on

let g:ale_linters = {
      \  'typescript': ['tslint']
      \}

let g:ale_fixers = {
      \ 'typescript': ['tslint'] 
      \}

" Disable these when you're old enough
"noremap <Up> ""
"noremap! <Up> <Esc>
"noremap <Down> ""
"noremap! <Down> <Esc>
"noremap <Left> ""
"noremap! <Left> <Esc>
"noremap <Right> ""
"noremap! <Right> <Esc>

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

"80 line limit for Comments
set formatoptions-=t
set textwidth=109

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

let base16colorspace=256
colorscheme base16-eighties

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
