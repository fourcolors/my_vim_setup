set nocompatible		" Make vim more usefule by turning off backwards compatiblity with vi

" Load Pathogen
filetype off
call pathogen#infect()

" File-type highlighting and configuration.
filetype plugin indent on

syntax on


" Tabs and Whitespace
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab       " expand tabs to spaces
set list listchars=tab:\ \ ,trail:·


" Indentation
set autoindent  " indent new lines
set smartindent " auto insert indentation on braces etc


" Completion
set wildmenu			" Make tab completion show a menu
set wildmode=list:longest,list:full	" Complete only up to the point of ambiguity
set wildignore=*.o,*.pyc,*.elc,*.obj,*.class,.git,.svn,*.rbc,vendor/gems/*


" Search
nnoremap / /\v
vnoremap / /\v
set ignorecase			" Searching case sensitive only when search has capital
set smartcase       "
set gdefault      " don't need /g after :s or :g, default replace on entire line not just first instance
set showmatch
set hlsearch 			" Highlight search terms...
set incsearch 			" ...dynamically as they are typed.


set encoding=utf-8

set scrolloff=3		" Scroll 3 lines instead of 1 when cursor goes off screen

set showmode 			" Current mode is displayed on bottom line

set showcmd 			" Show (partial) command in status bar

set hidden        " Allow switching buffers without writing to disk

set visualbell 			" Make bell visible instead of audible

set cursorline      " Make current line visible

set ttyfast         " Speed up redrawing operations

set ruler			" Show line, column, %, at bottom of window

set backspace=indent,eol,start 	" Intuitive backspacing in insert mode

set mousehide     " Hide mouse while typing

setlocal spell spelllang=en_us " Set spelling language
set nospell       " Turn off spelling, turn on as needed

set history=1000		" Keep a longer history

set shortmess=atI 		" Stifle many interruptive prompts

set confirm " use confirm instead of aborting an action

set lazyredraw " Don't update the display while executing macros

set grepprg=ack " use ack instead of grep


" Backups & Files
set backup			" Enable creation of backup file.
set backupdir=~/.vim/backups 	" Where backups will go.
set directory=~/.vim/tmp     	" Where temporary files will go.
let g:yankring_history_file = ".yankring_history" " Where the yankring plugin history should go


" Theme
set title			" vim will set title
set background=dark

" Color scheme
colorscheme paintbox
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Font stuff
set guifont=DejaVu\ Sans\ Mono:h16.00

" Window size stuff
set lines=50 columns=150

" Numbers
set number
set numberwidth=5

" ---------------------------------------------------------------------------
" Text type
" ---------------------------------------------------------------------------
"
" For .rabl type
au BufRead,BufNewFile *.rabl setf ruby

" For Haml
au! BufRead,BufNewFile *.haml setfiletype haml

" ---------------------------------------------------------------------------
" Plugins
" ---------------------------------------------------------------------------

" Command-T
let g:CommandTMaxHeight=20


" Supertab
let g:SuperTabDefaultCompletionType = "context"


" ---------------------------------------------------------------------------
"  Strip all trailing whitespace in file
" ---------------------------------------------------------------------------
function! StripWhitespace ()
    exec ':%s/ \+$//g'
endfunction


" ----------------------------------------------------------------------------
"  Key bindings / Mappings
" ----------------------------------------------------------------------------

" mapleader
let mapleader = ","

map <Leader>s :source $MYVIMRC<CR>
map <Leader>e :e $MYVIMRC<CR>

" <leader>t mapped to command-t
" <leader>c* mapped for nerdcommenter

" clear search
nnoremap <leader><space> :noh<cr>

map <Leader>w :call StripWhitespace ()<CR>

" map control-backspace to delete the previous word in insert mode
:imap <C-BS> <C-W>

"""Function key mappings
" f1 is help
map <F2> :Ack


" Fix command typos (stolen from Adam Katz)
nmap ; :

" ` is more useful than ' but less accessible.
nnoremap ' `
nnoremap ` '

" unmap arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" make j and k work better
nnoremap j gj
nnoremap k gk
