set nocompatible
set sh=/bin/bash
set backupdir=~/.vim_backup/
set directory=~/.vim_swp/
set ruler
set number
set laststatus=2
set incsearch
set showcmd
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set numberwidth=5
set textwidth=80
set ignorecase
set smartcase
set tags=./tags;
set guioptions-=T
set guioptions-=r
set foldenable
set foldmethod=manual
set mouse=a
set colorcolumn=80
set backspace=indent,eol,start
set nowrap

"maintain undo on a single session
"set hidden 

"Maintain undo forever, even after a restart
"tell it to use an undo file
set undofile

"set a directory to store the undo history(create this dir manually before)
set undodir=~/.vimundo/

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t

" If we are on OS X, NERDTree Arrows don't work well, so disable them
"let g:NERDTreeDirArrows=0

" Set up NeoBundle
set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch "Shougo/neobundle.vim"

" My bundles
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Essentials
NeoBundle "scrooloose/nerdtree"
NeoBundle "scrooloose/nerdcommenter"
NeoBundle "tomtom/tlib_vim"
NeoBundle "MarcWeber/vim-addon-mw-utils"
NeoBundle "bling/vim-airline"
NeoBundle "flazz/vim-colorschemes"
NeoBundle "tpope/vim-fugitive"
NeoBundle "tpope/vim-git"
NeoBundle "tpope/vim-surround"
NeoBundle "Shougo/unite.vim"
NeoBundle "Shougo/vimshell.vim"
NeoBundle "marijnh/tern_for_vim"
NeoBundle "coderifous/textobj-word-column.vim"

NeoBundle "Yggdroot/indentLine"
let g:indentLine_color_term = 252 
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_tty_light = 4
let g:indentLine_color_tty_dark = 2
let g:indentLine_char = '¦'

" Snips/Completation
let g:EclimCompletionMethod = 'omnifunc' " Eclim for JAVA

NeoBundle "ervandew/supertab"
NeoBundle "Shougo/neocomplcache.vim" " Should use neocomplete!!
NeoBundle "SirVer/ultisnips"
NeoBundle "honza/vim-snippets"

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" UltiSnips configs
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Make it colorful
NeoBundle "Rykka/colorv.vim"
NeoBundle "lilydjwg/colorizer"

" Javascript
NeoBundle "pangloss/vim-javascript"

" Less/Stylus
NeoBundle "groenewege/vim-less"
NeoBundle "wavded/vim-stylus.git"

" Jade
NeoBundle "digitaltoad/vim-jade"

" Meteor
NeoBundle "cmather/vim-meteor-snippets"

" HTML5
NeoBundle 'othree/html5.vim'

" Emmet 
NeoBundle "mattn/emmet-vim"

" Dash.app 
NeoBundle "rizzatti/dash.vim"

" PHP/Laravel things
NeoBundle "xsbeats/vim-blade.git" " Laravel blade templating engine
NeoBundle "StanAngeloff/php.vim"
"NeoBundle "m2mdas/phpcomplete-extended"
"NeoBundle "m2mdas/phpcomplete-extended-laravel"

" Lolololo loremipsum!!
NeoBundle "vim-scripts/loremipsum"

filetype plugin indent on

" Are there anything new to install?
NeoBundleCheck

" Load jade syntax
au BufNewFile,BufRead,BufReadPost *.jade.html set filetype=jade


" Colorize my colors here vim pl0x
let g:colorv_preview_ftype='css,php,html,js,coffee,sass,scss,less,styl,svg'


" Colorscheme
colorscheme jellybeans 
set background=dark
syntax on
"highlight ColorColumn ctermbg=white

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if has("autocmd")
  filetype plugin indent on

  autocmd BufNewFile,BufRead *.txt setfiletype text

  autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

  au FocusLost * :set number
  au InsertEnter * :set number

  augroup vimrcEx
    au!

    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif

    " Automatically load .vimrc source when saved
    autocmd BufWritePost .vimrc source $MYVIMRC

  augroup END

else
  set autoindent
endif " has("autocmd")

" automatically open quickfix window on grep searches
autocmd QuickFixCmdPost *grep* cwindow

if has("gui_running")
  set guifont=Menlo\ Regular:h14
endif

" Functions
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" Key Bindings
let mapleader = ","

inoremap kj <Esc>
inoremap <C-c> <Esc>
nnoremap <Leader>n :call NumberToggle()<cr>

" Is this for autocomplete?
"imap <Tab> <C-N>

" Split windows
nnoremap <Leader>h :sp<cr><C-w><C-w>
nnoremap <Leader>v :vsp<cr><C-w><C-w>

" Fugitive bindings
nnoremap <Leader>s :Gstatus<cr>

" Easily switch between windows
nnoremap <silent> <c-k> :wincmd k<cr>
nnoremap <silent> <c-j> :wincmd j<cr>
nnoremap <silent> <c-h> :wincmd h<cr>
nnoremap <silent> <c-l> :wincmd l<cr>

" VimShell
nnoremap <Leader>c :VimShell<cr> 

" Exit insert mode and write file
inoremap <leader>w <Esc> :w<cr>
nnoremap <leader>w :w<cr>

" NERDTreeToggle
nnoremap <leader><Tab> :NERDTreeToggle<cr>

" NERDCommenter
map <leader>m  <plug>NERDCommenterToggle


" Unite
let g:unite_source_history_yank_enable=1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <Leader>t :Unite -buffer-name=files -start-insert file_rec/async:!<cr>
nnoremap <Leader>f :Unite -buffer-name=files -start-insert file<cr>
nnoremap <Leader>r :Unite -buffer-name=mru -start-insert file_mru<cr>
nnoremap <Leader>g :Unite -buffer-name=register -start-insert register<cr>
nnoremap <Leader>o :Unite -buffer-name=outline -start-insert outline<cr>
nnoremap <Leader>y :Unite -buffer-name=yank history/yank<cr>
nnoremap <Leader>e :Unite -buffer-name=buffer buffer<cr>
