set encoding=utf-8
scriptencoding UTF-8
"During this file you might find "TurtleOnATree" in some comments, that's
" cause the code is exactly like a turtle on a tree: I don't know who put it
" up there, I don't know why is he up there, but I might brake something if I
" try to took him out there, so I'll just leave the turtle up there 
if has('win32') || has('win64') || has('win16')
    set shell=$COMSPEC " If on windows, shell is cmd.exe
    source $VIMRUNTIME/mswin.vim
    behave mswin
else
    set shell=/bin/bash
endif
runtime macros/matchit.vim

set nocompatible              " be iMproved, required
filetype off                  " required


" to install Plug, run:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" git helper
Plug 'tpope/vim-fugitive'
" git diff shower
Plug 'airblade/vim-gitgutter'
" syntastic MUST WORK UGH
Plug 'scrooloose/syntastic'
" Surround words lines and blocks with { [ "' EVERYTHING
Plug 'tpope/vim-surround'
"solarized
Plug 'altercation/vim-colors-solarized'
Plug 'editorconfig/editorconfig-vim'

Plug 'jnurmine/Zenburn'
" airline (powerline but lighter
Plug 'bling/vim-airline'
" vim-sneak: s{char}{char} to go to there
Plug 'justinmk/vim-sneak'
" automatically closes the thing
Plug 'jiangmiao/auto-pairs'
" Syntax highlight for fish scripts
Plug 'dag/vim-fish', {'for': 'fish'}
"YouCompleteMe (must build in the platform!)
"Plug 'Valloric/YouCompleteMe'
"YCM generator for cmake et al
"Plug 'rdnetto/YCM-Generator'

Plug 'Shougo/neocomplete.vim'

" open files by pressign ctrl + P
Plug 'kien/ctrlp.vim'

"closure plugins 
" vim-freplace provides a REPL for Closure (cpp runs the command under the
" cursor) MUST run lein repl vefore opening vim to use this
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
" Rainbow parentheses helps seeing scopes withing brackets and parethesis
Plug 'kien/rainbow_parentheses.vim', {'for': 'clojure'}

" Autoformat
Plug 'Chiel92/vim-autoformat'

" pretty straightforward right
Plug 'vim-scripts/indentpython.vim', {'for': 'python'}
"better syntastic addon for python
Plug 'nvie/vim-flake8', {'for': 'python'}


Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'


" Better handling of javascript and JSX (react)
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'mxw/vim-jsx', {'for': 'javascript'}
"tern: autocomplete and analysis in javascript (must npm install in the
"directory)
Plug 'ternjs/tern_for_vim', {'for': 'javascript', 'do': 'npm install --global tern'}
Plug 'bigfish/vim-js-context-coloring', {'for': 'javascript', 'do': 'npm install --update'}

" Android environment (needs ANDROID_HOME and lots of other variables)
Plug 'hsanson/vim-android', {'for': 'java'}
" Java autocompletion
Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}
" search for a .git and set the working directory to there
Plug 'airblade/vim-rooter'

" Bwetter horizontal split
Plug 'wellle/visual-split.vim'


" comunicate with other processes (needed by vebugger)
Plug 'Shougo/vimproc.vim', {'do': 'make'}
" a front-end debugger for vim (gdb, jdb)
Plug 'idanarye/vim-vebugger'

call plug#end()            " required
filetype plugin indent on    " required



" automatically turn rainbow parethesis on when opening vim
augroup closure_things
au FileType closure au VimEnter * RainbowParenthesesToggle
            \ au Syntax * RainbowParenthesesLoadRound
            \ au Syntax * RainbowParenthesesLoadSquare
            \ au Syntax * RainbowParenthesesLoadBraces
augroup END

augroup java_things
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
augroup END

" JSDoc syntax hihglight
let g:javascript_plugin_jsdoc = 1
" set function name highlighted
let g:js_context_colors_highlight_function_names = 1
" disable js estranho by default
let g:js_context_colors_enabled = 0
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
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
let g:syntastic_c_checkers = ['make', 'gcc']
let g:syntastic_cpp_checkers = ['make', 'gcc']
let g:syntastic_python_checkers = ['pylint', 'python'] 
let g:syntastic_java_checkers = ['javac'] " comes with the jdk
let g:syntastic_vim_checkers = ['vint'] " pip install vim-vint
let g:syntastic_ruby_checkers = ['rubylint'] " gem install ruby-lint
let g:syntastic_verilog_checkers = ['iverilog']
let g:syntastic_go_checkers = ['go']
let g:syntastic_error_symbol = 'X'
let g:syntastic_style_error_symbol = '>'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_warning_symbol = '>'

" Disable vim-rooter automatically
let g:rooter_manual_only = 1

" Open NERDtree automatically
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_autofind = 1
let g:nerdtree_tabs_focus_on_files = 1

" space t opens nerdtree
map <Leader>t :NERDTreeTabsToggle<CR>

map <c-s-[> :bp<CR>
map <c-s-]> :bn<CR>

" "TurtleOnATree" it's actually for faster MacVim
set ttyfast

"autocompletion for filenames
set wildmode=longest,list,full
set wildmenu

let $PATH='/usr/local/bin:' . $PATH

" Leader Mappings
let mapleader = "\<Space>"

" JK motions: Line motions
map <Leader>n :lnext<CR>
map <Leader>N :lprev<CR>

" My fat finger doesn't get out of shift in time, so I'll add this here
command! W :w
command! Q :q
command! Wq :wq
command! QQ :q!
command! Qq :q!


" faster syntastic, git gutter and such
set updatetime=250
"" poweline support
set guifont=Inconsolata\ for\ Powerline:h15
set t_Co=256
"hide whitespace if there's a char after it
set fillchars+=stl:\ ,stlnc:\

" highlight vertical column of cursor #does this work?
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline 
"set cursorline 

" airline configs
set laststatus=2 "makes the second line always visible 
let g:airline_powerline_fonts = 1


" Command aliases
cabbrev tp tabprev
cabbrev tn tabnext
cabbrev tf tabfirst
cabbrev tl tablast

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=500
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set hlsearch      " highlight matches
set autowrite     " Automatically :write before running commands

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = '*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**'

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has('gui_running')) && !exists('syntax_on')
  syntax on
endif

if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif

if filereadable(expand('~/.vimrc.bundles'))
  source ~/.vimrc.bundles
endif

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab
set fileformat=unix

augroup py_identations
    au Filetype python set textwidth=79
augroup END

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

augroup neocomplete
    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"point the omnicompletion for tern on js
let g:neocomplete#sources#omni#functions = 
        \ { 'javascript': [
        \       'tern#Complete',
        \   ]
        \ }
"{
"  "ecmaVersion": 5,
"  "libs": [
"    "browser",
"    "jquery"
"  ],
"  "loadEagerly": [
"    "./sapui5/openui5-sdk-1-2/resources/sap-ui-core-all-dbg.js"
"  ],
"  "plugins": {
"      "cordovajs": {}
"  }
"}

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
let python_highlight_all=1
"let g:ycm_python_binary_path = '/usr/local/bin/python3'

" Display extra whitespace
set list listchars=tab:·\ ,trail:·

set smartcase
set ignorecase
set noantialias


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

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~# '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

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

" Move lines and blocks with Ctrl Shift  + j and ctrl shift  + k
nnoremap <c-s-j> :m .+1<CR>
nnoremap <c-s-k> :m .-2<CR>
vnoremap <c-s-j> :m '>+1<CR>gv
vnoremap <c-s-k> :m '<-2<CR>gv

" search visually selected text with *
vnoremap <silent> * :<C-U>
          \let old_reg=getreg('"')<bar>
          \let old_regmode=getregtype('"')<cr>
          \gvy/<C-R><C-R>=substitute(
          \escape(@", '\\/.*$^~[]'), '\n', '\\n', 'g')<cr><cr>
          \:call setreg('"', old_reg, old_regmode)<cr>

" Local config
if filereadable($HOME . '/.vimrc.local')
  source ~/.vimrc.local
endif

" enable per project vimrc
set exrc
" should be at the end of vimrc to disable malicious execution of per-project
" vimrc
set secure
