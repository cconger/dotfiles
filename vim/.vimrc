execute pathogen#infect()

" Disable these when you're old enough
"noremap <Up> ""
"noremap! <Up> <Esc>
"noremap <Down> ""
"noremap! <Down> <Esc>
"noremap <Left> ""
"noremap! <Left> <Esc>
"noremap <Right> ""
"noremap! <Right> <Esc>

" have command-line completeion <Tab> first list the available options and complete the longest common part
" then have further <Tab>s cycle through the possiilities:
set wildmode=list:longest,full

let python_highlight_all=1
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
set textwidth=79

"Search
set hls
set incsearch

"Enable Filetype detection
filetype on

set smartindent

set backupdir=~/.tmp
set dir=~/.tmp/swap

set background=dark
colorscheme base16-default

" PYTHON SPECIFIC SETTINGS

" Number of spaces to use for an indent
au BufRead,BufNewFile *.py,*pyw set shiftwidth=2

" Number of spaces that a pre-existing tab is equal to
au BufRead,BufNewFile *py,*pyw set tabstop=2

" Replace tabs with equivilent number of spaces
au BufRead,BufNewFile *.py,*.pyw set expandtab

" Show BadWhitespace
highlight BadWhitespace ctermbg=red guibg=red

" Display leading tabs as bad whitespace
au BufRead,BufNewFile *.py,*.pyw,*.cc,*.h,*.cpp call matchadd("BadWhitespace",'^\t\+')
" Display trailing whitespace as bad
au BufRead,BufNewFile *.py,*.pyw,*.cc,*.h,*.cpp call matchadd("BadWhitespace",'\s\+$')

filetype indent on
