set encoding=utf-8
scriptencoding UTF-8
"During this file you might find "TurtleOnATree" in some comments, that's
" cause the code is exactly like a turtle on a tree: I don't know who put it
" up there, I don't know why is he up there, but I might brake something if I
" try to take him out of there, so I'll just leave the turtle up there 
if has('win32') || has('win64') || has('win16')
    set shell=$COMSPEC " If on windows, shell is cmd.exe
    source $VIMRUNTIME/mswin.vim
    behave mswin
else
    set shell=/bin/bash
endif
runtime macros/matchit.vim

set nocompatible              " be iMproved, required

function! InstallPackage(arg)
    if executable('yum')
        let out = "sudo yum install -y "
    elseif executable('brew')
        let out = "brew install "
    endif
    return out . a:arg
endfunction

" to install Plug, run:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
call plug#begin('~/.vim/plugged')

" git helper
Plug 'tpope/vim-fugitive'
" :%S subtitute keeping case
Plug 'tpope/vim-abolish'
" git diff shower
Plug 'airblade/vim-gitgutter'
" syntastic MUST WORK UGH
Plug 'scrooloose/syntastic'
" Surround words lines and blocks with { [ "' EVERYTHING
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'

" themes
Plug 'mhartington/oceanic-next'
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

" typescript syntax
Plug 'HerringtonDarkholme/yats.vim'

" completion from syntax!
Plug 'Shougo/neco-syntax'
Plug 'rdolgushin/groovy.vim'
" show all tags in a beautiful widnow 
Plug 'majutsushi/tagbar'

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

Plug 'lervag/vimtex', {'for': ['tex', 'plaintex', 'bst']}

Plug 'terryma/vim-multiple-cursors'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'


" Better handling of javascript and JSX (react)
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx', {'for': 'javascript'}

Plug 'tomlion/vim-solidity'
" Android environment (needs ANDROID_HOME and lots of other variables)
Plug 'hsanson/vim-android', {'for': 'java'}
" search for a .git and set the working directory to there
Plug 'airblade/vim-rooter'

" Bwetter horizontal split
Plug 'wellle/visual-split.vim'

" add goto definition in vim
Plug 'Yohanna/vim-gotosymbol'

" Helpers for the following plugin
Plug 'xolox/vim-misc'
" load tags automatically
Plug 'xolox/vim-easytags', {'do': InstallPackage('ctags') . '; npm install -g jsctags' }

" Highlight every word under cursor
Plug 'itchyny/vim-cursorword'
" comunicate with other processes (needed by vebugger)
Plug 'Shougo/vimproc.vim', {'do': 'make'}
" a front-end debugger for vim (gdb, jdb)
Plug 'idanarye/vim-vebugger'

" PlantUML is a program to create UML diagrams
Plug 'aklt/plantuml-syntax'

"Open any link from vim (dependency to plantuml previewe)
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'


" autocomplete
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}



call plug#end()            " required
filetype plugin indent on    " required


" Leader Mappings
let mapleader = "\<Space>"

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
let g:syntastic_python_checkers = ['python3'] 
let g:syntastic_java_checkers = ['javac'] " comes with the jdk
let g:syntastic_vim_checkers = ['vint'] " pip install vim-vint
let g:syntastic_ruby_checkers = ['rubylint'] " gem install ruby-lint
let g:syntastic_verilog_checkers = ['iverilog']
let g:syntastic_go_checkers = ['go']
let g:syntastic_enable_r_lintr_checker = 1
let g:syntastic_r_checkers = ['lintr']
let g:syntastic_error_symbol = 'X'
let g:syntastic_style_error_symbol = '>'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_warning_symbol = '>'

" Disable vim-rooter automatically
let g:rooter_manual_only = 1

" Open NERDtree automatically
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_autofind = 1
let g:nerdtree_tabs_focus_on_files = 5


" enable <Leader> and a shit other stuff in debug
let g:vebugger_leader = 1


" space nt opens nerdtree
nmap <silent> <leader>nt :NERDTreeToggle<CR>
" space tg opens tagbar
nmap <silent> <leader>tb :TagbarToggle<CR>
" Ctags, check the parent directories for tags, too.
set tags=./.tags;,./tags
let g:easytags_dynamic_files = 1
let g:easytags_file = '~/.vim/tags'
let g:easytags_updatetime_min=12000
let g:easytags_async = 1


" "TurtleOnATree" it's actually for faster MacVim
set ttyfast

"autocompletion for filenames
set wildmode=longest,list,full
set wildmenu


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
set breakindent   " break line without breaking indent" (reallyyyy goooooood)

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = '*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**'

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has('gui_running')) && !exists('syntax_on')
  syntax on
endif

if (has("termguicolors"))
    set termguicolors
endif
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

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

" START: DEOPLETE
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" TODO list of npm packages that need to be globally installed after
" installing this vimrc
" javascript-typescript-langserver

let g:nvim_typescript#server_path = '/usr/local/bin/tsserver'

" Required for operations modifying multiple buffers like rename.
set hidden

" END: DEOPLETE


" Disable neocomplete when usign multipleCursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction


" Ctags, check the parent directories for tags, too.
set tags=./.tags;,./tags
let g:easytags_dynamic_files = 1
let g:easytags_file = '~/.vim/tags'
let g:easytags_updatetime_min=12000
let g:easytags_async = 1
let g:easytags_languages = {
            \   'javascript': {
            \       'cmd': 'jsctags',
            \       'args': [],
            \       'fileoutput_opt': '-f',
            \       'stdout_opt': '-f-',
            \       'recurse_flag': '-R'
            \   }
            \}
" ctags
let g:tagbar_type_javascript = {
    \ 'ctagsbin' : substitute(system('which jsctags'), '\n\+$', '', '')
\ }

let python_highlight_all=1

" Display extra whitespace
set list listchars=tab:·\ ,trail:·

set smartcase
set ignorecase
if !has('nvim')
    set noantialias
endif


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

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l

" Move lines and blocks with Ctrl Shift  + j and ctrl shift  + k
nnoremap <c-j> :m .+1<CR>
nnoremap <c-k> :m .-2<CR>
vnoremap <c-j> :m '>+1<CR>gv
vnoremap <c-k> :m '<-2<CR>gv

" search visually selected text with 
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


" if hidden is not set, TextEdit might fail.
set hidden

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }


" enable per project vimrc
set exrc
" should be at the end of vimrc to disable malicious execution of per-project
" vimrc
set secure
