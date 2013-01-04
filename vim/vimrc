" Load Pathogen
" =============
"
filetype off
call pathogen#infect()

" set options
" ===========
"
set shell=sh

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set noswapfile
set nobackup     " do not keep a backup file (file~), use versions instead
set history=1000 " keep 1000 lines of command line history
set ruler        " show the cursor position all the time

set laststatus=2 " always show the editing status bar at the bottom
set showcmd      " display incomplete commands
set incsearch    " do incremental searching

filetype plugin indent on

" let g:Powerline_symbols = 'fancy'

" In many terminal emulators the mouse works just fine, thus enable it.
" set mouse=a

set autoindent

set foldmethod=marker " or: syntax manual
set foldlevel=0
" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window.
" autocmd InsertEnter * let w:last_fdm=&foldmethod | setlocal foldmethod=manual
" autocmd InsertLeave * let &l:foldmethod=w:last_fdm

set number            " line numbering
set tabstop=2         " set tabs to 2 spaces
set shiftwidth=2
set expandtab

set linebreak         " wrap on words rather than characters
set textwidth=80      " insert EOL after 75 columns

set ignorecase        " ignore case in search patterns

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" setlocal spell spelllang=en_us   " set the spellcheck to english
set mousemodel=popup_setpos      " set the right click in gvim to spellcheck

set thesaurus+=~/.vim/mthesaur-vim.txt " Thesaurus
" This will consider spaces and -'s as part of words in the thesaurus file
" Really messes up syntax highlighting though, must be a better way
" set iskeyword+=32,-

" Diff Settings
set diffopt+=iwhite " Ignore whitespace in vimdiff

" Autocommands
" ============
"
" Clear trailing whitespace before a save
autocmd BufWritePre * :%s/\s\+$//e

" Set filetype options based on extensions
augroup arduino
au BufNewFile,BufRead *.ino set ft=cpp syntax=cpp shiftwidth=2 tabstop=2
augroup END

augroup markdown
au BufNewFile,BufRead *.mkd set ft=markdown.liquid syntax=markdown.liquid shiftwidth=3 tabstop=3
augroup END

augroup htmlerb
au BufNewFile,BufRead *.html set ft=html.liquid syntax=liquid
au BufNewFile,BufRead *.erb set ft=html.eruby.eruby-rails syntax=eruby
au BufNewFile,BufRead *.less set ft=css
augroup END

au FileType *eruby* let g:surround_45 = "<% \r %>"
au FileType *eruby* let g:surround_61 = "<%= \r %>"

autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Source the vimrc file after saving it
" if has("autocmd")
"   autocmd bufwritepost .vimrc source $MYVIMRC
" endif

" Better syntax highlighting for python
au FileType python set complete+=k~/.vim/bundle/python_syntax/syntax/python.vim isk+=.,(
au FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Color options
" =============
"
"if $TERM == 'xterm-256color'
  set t_Co=256 " set 256 color terminal
  "let g:solarized_termcolors=256
"endif

" set background=light
set background=dark
colors solarized

"colors warm_grey
"colors molokai
"colors fine_blue
"colors mac_classic

" GUI vim (gvim) settings
" =======================
"
if has('gui_running')
  if has("gui_gtk2")
    set guifont=Anonymous\ Pro\ for\ PowerLine\ 14
  elseif has("gui_macvim")
    " set guifont=Anonymous\ Pro\ for\ PowerLine:h27
    set guifont=LettrGoth12\ BT:h23
  endif
  set guioptions=agm
  "set guioptions=aegimtT
  set visualbell
  set vb t_vb=
endif

" Key Mappings
" ============
"
" Allow access to the gvim Menu by hitting F4 in vim
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F4> :emenu <C-Z>

" F9 will turn spell checking on or off in normal and insert mode
map <F9> :setlocal spell! spelllang=en_us<cr>

let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>
" Scrolling
" nmap <C-E> jzz
" nmap <C-Y> kzz

" MacVim is flaky with c-x c-*, set c-o to omnicomplete
imap <C-O> <C-X><C-O>

" pressing space twice will move to the next split
" map <space><space> <c-W>w

" F10 to make and view a latex pdf
" map <F10> :w<CR>:!make clean; make `basename % .tex`; evince `basename % .tex`.pdf &<cr>
" imap <F10> <ESC>:w<CR>:!make clean; make `basename % .tex`; evince `basename % .tex`.pdf &<cr>

" Symbol listing - requires ctags
nmap  <F12> :TagbarToggle<CR>

" Remap Esc
imap jj <Esc>l

" Alt-C and V copy and paste to and from the system clipboard
map <M-c> "*y
map <M-v> "*p

" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L>

nmap T :tabe<CR><C-P>
map Y :Explore<CR>

" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e
" " Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" Open file browser
nnoremap <silent> <F2> :NERDTreeToggle<CR>

" Plugin Options
" ==============
"
" Use :C to run a calculation, needs ruby support
" :command! -nargs=+ C :ruby puts <args>

let g:user_zen_settings       = { 'erb' : { 'extends' : 'html' } }
let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag    = 1

" Netrw settings
" ==============
"
set wildignore+=.git,*vendor/cache/*,*vendor/rails/*,*vendor/ruby/*,*/pkg/*,*/tmp/*
let g:netrw_winsize               = 80
"let g:netrw_liststyle             = 3
"let g:netrw_list_hide             = '.*\.o$'
let g:netrw_browse_split          = 0
let Tlist_File_Fold_Auto_Close    = 1
"let Tlist_Show_One_File          = 1
let Tlist_Display_Tag_Scope       = 0
let Tlist_Auto_Update             = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_Right_Window        = 1
let Tlist_Use_SingleClick         = 0
let Tlist_Sort_Type               = "name"
let Tlist_Enable_Fold_Column      = 0
let Tlist_File_Fold_Auto_Close    = 1
let NERDTreeMinimalUI=1

" Vim and Grep Helpers
nmap <leader>g :execute " grep -srnw --binary-files=without-match --exclude=tags --exclude-dir=.git --exclude-dir=vendor --exclude-dir=pkg --exclude-dir=html . -e " . expand("<cword>") . " " <bar> cwindow<CR>
nmap <leader>G :execute " grep -srnw --binary-files=without-match --exclude=tags --exclude-dir=.git --exclude-dir=vendor --exclude-dir=pkg --exclude-dir=html . -e \"" . expand("<cWORD>") . "\" " <bar> cwindow<CR>

" NeoComplCache Settings
" ======================
"
" imap <C-k> <Plug>(neocomplcache_snippets_expand)
" smap <C-k> <Plug>(neocomplcache_snippets_expand)
" nmap <leader>b :NeoComplCacheToggle<CR>

" let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_enable_underbar_completion = 1
" let g:neocomplcache_min_syntax_length = 3

" if !exists('g:neocomplcache_omni_patterns')
"   let g:neocomplcache_omni_patterns = {}
" endif
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" If the above crashes vim, this forces neocomp to call omnicomplete directly
" if !exists('g:neocomplcache_force_omni_patterns')
"   let g:neocomplcache_force_omni_patterns = {}
" endif
" let g:neocomplcache_force_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" neocomplcache
" A beter autocomplete system!

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_smart_case = 1

" default # of completions is 100, that's crazy
let g:neocomplcache_max_list = 5

" words less than 3 letters long aren't worth completing
let g:neocomplcache_auto_completion_start_length = 3

" Map standard Ctrl-N completion to Cmd-Space
inoremap <D-Space> <C-n>

" This makes sure we use neocomplcache completefunc instead of
" the one in rails.vim, otherwise this plugin will crap out
let g:neocomplcache_force_overwrite_completefunc = 1

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" Prevent hanging with python: https://github.com/skwp/dotfiles/issues/163
let g:neocomplcache_omni_patterns['python'] = ''

" Custom Functions
" ================
"
" Color Scheme Helpers
" Show syntax highlighting groups for word under cursor
" nmap <leader>b :call <SID>SynStack()<CR>
" function! <SID>SynStack()
"   if !exists("*synstack")
"     return
"   endif
"   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfunc

" function! DokuLink()
"   let @l = 'BysW]ysW]EbbywPa|$'
" endfunction
" function! AlignDokuTable()
"   let @p = '{V}:s/\v\^|\| | \|/COL/g{V}:Align COLjV:s/COL/^/gjV}:s/COL/|/g{V}<'
" endfunction

" map <leader>k :call AlignDokuTable()<CR>@p
" map <leader>l :call DokuLink()<CR>@l
