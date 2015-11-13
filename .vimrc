"During this file you might find "TurtleOnATree" in some comments, that's
" cause the code is exactly like a turtle on a tree: I don't know who put it
" up there, I don't know why is he up there, but I might brake something if I
" try to took him out there, so I'll just leave the turtle up there 
if has("win32") || has("win64") || has("win16")
    set shell=$COMSPEC " If on windows, shell is cmd.exe
    source $VIMRUNTIME/mswin.vim
    behave mswin
else
    set shell=/bin/bash
endif
runtime macros/matchit.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" git helper
Plugin 'tpope/vim-fugitive'
" syntastic MUST WORK UGH
Plugin 'scrooloose/syntastic.git'
" Surround words lines and blocks with { [ "' EVERYTHING
Plugin 'tpope/vim-surround.git'
"solarized
Plugin 'altercation/vim-colors-solarized.git'
" airline (powerline but lighter
Plugin 'bling/vim-airline.git'
" minimap on vim
Plugin 'severin-lemaignan/vim-minimap'
" easymotion (like vimium but for vim [???])
Plugin 'easymotion/vim-easymotion'
" Auto close brackets (Cry)
Plugin 'vim-scripts/AutoClose'
" Syntax highlight for fish scripts
Bundle 'dag/vim-fish'
call vundle#end()            " required
filetype plugin indent on    " required

" Enable Omni autocompletion, an code completion built inside of vim (not that
" good :(
set omnifunc=syntaxcomplete#Complete

"let g:syntastic_debug = 3
" Configurations for Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_javascript_checkers = ['eslint'] "npm i -g eslint-plugin-openui5 && npm install -g eslint
let g:syntastic_haskell_checkers = ['ghc_mod', 'hlint'] 
" cabal update && cabal install ghc-mod and add /Libray/Haskell/bin to
" systemPath
let g:syntastic_c_checkers = ['gcc']
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_python_checkers = ['pylint', 'python'] 
let g:syntastic_java_checkers = ['javac'] " comes with the jdk
let g:syntastic_vim_checkers = ['vint'] " pip install vim-vint
let g:syntastic_ruby_checkers = ['rubylint'] " gem install ruby-lint
let g:syntastic_verilog_checkers = ['iverilog']
let g:syntastic_error_symbol = 'X'
let g:syntastic_style_error_symbol = '>'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_warning_symbol = '>'

" add haskell to the path so ghc_mod works 
let $PATH=$PATH.':/Library/Haskell/bin:/Library/Haskell/bin'

" "TurtleOnATree" it's actually for faster MacVim
set ttyfast
set lazyredraw

"autocompletion for filenames
set wildmode=longest,list,full
set wildmenu

let $PATH='/usr/local/bin:' . $PATH

:au FocusLost * :wa "Save on focus lost

" Sessions # "TurtleOnATree" let g:session_autoload = 'no'

" Leader Mappings
let mapleader = "\<Space>"

map <Leader> <Plug>(easymotion-prefix)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>n :lnext<CR>
map <Leader>N :lprev<CR>

" Run current file as python
map <Leader>p :!python %<CR>

" My fat finger doesn't get out of shift in time, so I'll add this here
command! W :w
command! Q :q

" type jj to leave insert mode
:inoremap jj <Esc>
"" poweline support
set guifont=Inconsolata\ for\ Powerline:h15
set encoding=utf-8
set t_Co=256
"hide whitespace if there's a char after it
set fillchars+=stl:\ ,stlnc:\

" highlight vertical column of cursor #does this work?
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline 
set cursorline 

" airline configs
set laststatus=2 "makes the second line always visible 
set encoding=utf-8
let g:airline_powerline_fonts = 1


" key to insert mode with paste using F2 key # "TurtleOnATree"
map <F2> :set paste<CR>i
" Leave paste mode on exit
au InsertLeave * set nopaste

" Command aliases
cabbrev tp tabprev
cabbrev tn tabnext
cabbrev tf tabfirst
cabbrev tl tablast

set backspace=2   " Backspace deletes like most programs in insert mode
set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=500
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set hlsearch      " highlight matches
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = '*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**'

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has('gui_running')) && !exists('syntax_on')
  syntax on
endif

if filereadable(expand('~/.vimrc.bundles'))
  source ~/.vimrc.bundles
endif

" bind K to search word under cursor
"# I don't know why this doesn't work, I'll implement it myself
" nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap K :/<C-R><C-W>/<CR>

" 4 spaces tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

:set smartcase
:set ignorecase
:set noantialias

" Color scheme
colorscheme solarized
set background=dark
set encoding=utf-8

" Highlight line number of where cursor currently is
hi CursorLineNr guifg=#050505

" Numbers "TurtleOnATree"
set number
set numberwidth=5

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

:nnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
:nnoremap <expr> yy (v:register ==# '"' ? '"+' : '') . 'yy'
:nnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'
:xnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
:xnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Local config
if filereadable($HOME . '/.vimrc.local')
  source ~/.vimrc.local
endif

