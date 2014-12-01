" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off
call pathogen#incubate() " Load Pathogen

runtime macros/matchit.vim     " Load the matchit plugin.
set shell=sh
set cursorline
" set autochdir                  " autochdir  change to directory of file in buffer
set wildmode=list:longest      " specifies how command line completion works
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set noswapfile
set nobackup                   " do not keep a backup file (file~), use versions instead
set history=1000               " keep 1000 lines of command line history
set ruler                      " show the cursor position all the time
set laststatus=2               " always show the editing status bar at the bottom
set showcmd                    " display incomplete commands
set incsearch                  " do incremental searching
set autoindent
set nonumber                     " line numbering
set tabstop=2                  " set tabs to 2 spaces
set shiftwidth=2
set expandtab
set linebreak                  " wrap on words rather than characters
set textwidth=80               " insert EOL after 75 columns
set ignorecase                 " ignore case in search patterns
set smartcase
set diffopt+=iwhite            " Ignore whitespace in vimdiff
set hidden
set shortmess=at

filetype plugin indent on

let g:tmuxline_separators = {
    \ 'left' : '⮀',
    \ 'left_alt': '⮁',
    \ 'right' : '⮂',
    \ 'right_alt' : '⮃',
    \ 'space' : ' '}

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_symbols = {}
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" let g:airline_theme='powerlineish'
" let g:airline_theme='dark'
let g:airline_theme='base16'
" let g:airline_theme='badwolf'
" let g:airline_theme='molokai'
" let g:airline_theme='light'
" let g:airline_theme='solarized'
" let g:airline_theme='simple'

set mouse=a " In many terminal emulators the mouse works just fine, thus enable it.

" set foldcolumn=3
set foldlevel=999
set foldmethod=manual " syntax manual indent
" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window.
autocmd InsertEnter * let w:last_fdm=&foldmethod | setlocal foldmethod=manual
autocmd InsertLeave * let &l:foldmethod=w:last_fdm

syntax on    " Switch syntax highlighting on, when the terminal has colors
set hlsearch " Also switch on highlighting the last used search pattern.

set mousemodel=popup_setpos      " set the right click in gvim to spellcheck

set thesaurus+=~/.vim/mthesaur-vim.txt " Thesaurus
" This will consider spaces and -'s as part of words in the thesaurus file
" Really messes up syntax highlighting though, must be a better way
" set iskeyword+=32,-


" Autocommands
" ============

" Jump to last position in a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Clear trailing whitespace before a save
autocmd BufWritePre * :%s/\s\+$//e | retab

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

au FileType *eruby* let g:surround_{char2nr("-")} = "<% \r %>"
au FileType *eruby* let g:surround_{char2nr("=")} = "<%= \r %>"

autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Source the vimrc file after saving it
" if has("autocmd")
"   autocmd bufwritepost .vimrc source $MYVIMRC
" endif

" Better syntax highlighting for python
" au FileType python set complete+=k~/.vim/bundle/python_syntax/syntax/python.vim isk+=.,(
" au FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
" au FileType python noremap <leader>t :w\|:!py.test %<cr>

au FileType python set ts=4 sw=4 tw=0
let g:python_highlight_all = 1

let g:jedi#usages_command = ""
let g:jedi#rename_command = ""

" python-mode
let g:pymode_lint = 0
let g:pymode_lint_checker = "pyflakes,pep8,mccabe"
let g:pymode_lint_write = 0
let g:pymode_lint_ignore = "E221,E201,E202"

let g:pymode_lint_signs = 0
let g:pymode_motion = 0
let g:pymode_virtualenv = 1


" Color options
" =============
"
"if $TERM == 'xterm-256color'
  set t_Co=256 " set 256 color terminal
  "let g:solarized_termcolors=256
"endif

" set background=light
set background=dark
" colors solarized
let base16colorspace=256
" colors base16-ocean
colors base16-eighties
" colors irblack
" colors warm_grey
" colors molokai
" colors fine_blue
" colors mac_classic

" GUI vim (gvim) settings
" =======================
if has("gui_running")
  if has("gui_gtk2")
    " set guifont=Anonymous\ Pro\ for\ PowerLine\ 14
    set guifont=PragmataPro\ 26
  elseif has("gui_macvim")
    " set guifont=Anonymous\ Pro\ for\ PowerLine:h27
    " set guifont=LettrGoth12\ BT:h23
    set guifont=PragmataPro:h26
  endif
  set guioptions=agm
  "set guioptions=aegimtT
  set visualbell
  set vb t_vb=
endif

" Key Mappings
" ============
let mapleader = ","

noremap <leader>m :TagbarToggle<cr>

setlocal spell spelllang=en_us   " set the spellcheck to english
noremap <leader>s :setlocal spell! spelllang=en_us<cr>
set nospell

" Macro Keybinding
" nnoremap <leader>d f"wdi"<esc>o<esc>p==kf"dW$bido <esc>o<i class="color-icon-"></i><esc>jo<% end %><esc>
nnoremap <leader>d :diffput<CR>:diffupdate<CR>
nnoremap <leader>B :TagbarToggle<CR>

nnoremap <leader>v :tabedit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<cr>

noremap <leader>p :set paste!<cr>

noremap <leader>G :Gstatus<cr>
noremap <leader>D :Gdiff<cr>

" Allow access to the gvim Menu by hitting F4 in vim
" source $VIMRUNTIME/menu.vim
" set wildmenu
" set cpo-=<
" set wcm=<C-Z>
" noremap <F4> :emenu <C-Z>

" Scrolling
" nnoremap <C-E> jzz
" nnoremap <C-Y> kzz

" Indent and unindent without leaving visual mode
vnoremap < <gv
vnoremap > >gv

" Make :W same as :w
command! W :w
command! Q :q

" MacVim is flaky with c-x c-*, set c-o to omnicomplete
" inoremap <C-O> <C-X><C-O>

" Insert a hash rocket with <c-l>
inoremap <c-l> <space>=><space>

" Can't be bothered to understand ESC vs <c-c> in insert mode
inoremap <c-c> <esc>

" Remap Esc
inoremap jj <Esc>l

" pressing space twice will move to the next split
" noremap <space><space> <c-W>w

" F10 to make and view a latex pdf
" noremap <F10> :w<CR>:!make clean; make `basename % .tex`; evince `basename % .tex`.pdf &<cr>
" inoremap <F10> <ESC>:w<CR>:!make clean; make `basename % .tex`; evince `basename % .tex`.pdf &<cr>

" Symbol listing - requires ctags
nnoremap  <F12> :TagbarToggle<CR>

" Alt-C and V copy and paste to and from the system clipboard
" noremap <M-c> "*y
" noremap <M-v> "*p

" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L>

nmap <leader>; :tabe<CR><C-P>
nmap <leader>l :vs<CR><C-P>
" nnoremap <leader>l <cr><c-w>50\|<c-w><c-w>
" nnoremap <leader>k :set foldcolumn=0\|:set nonumber<cr><c-w>50\|<c-w><c-w>:set foldcolumn=3\|:set number<cr>
nnoremap <leader>k :set nonumber<cr><c-w>30\|<c-w><c-w>:set number<cr>

" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e
" " Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
" ================================================================
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Plugin Options
" ==============
"
" Use :C to run some ruby code
" :command! -nargs=+ C :ruby puts <args>

" Netrw settings
" ==============
"
set wildignore+=.git,*vendor/cache/*,*vendor/rails/*,*vendor/ruby/*,*/pkg/*,*/tmp/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](env.*|html|\.git|\.hg|\.svn)$',
  \ 'file': '\v\.(pyc|exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
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

" let NERDTreeMinimalUI=1
" let NERDTreeHijackNetrw=1

" Vim and Grep Helpers
" nnoremap <leader>g :execute " grep -srnw --binary-files=without-match --exclude=tags --exclude-dir=.git --exclude-dir=vendor --exclude-dir=pkg --exclude-dir=html . -e " . expand("<cword>") . " " <bar> cwindow<CR>
" nnoremap <leader>G :execute " grep -srnw --binary-files=without-match --exclude=tags --exclude-dir=.git --exclude-dir=vendor --exclude-dir=pkg --exclude-dir=html . -e \"" . expand("<cWORD>") . "\" " <bar> cwindow<CR>

" cabbrev ack grep -srnw --binary-files=without-match --exclude=tags --exclude-dir=.git --exclude-dir=vendor --exclude-dir=pkg --exclude-dir=html . -e "

" " NeoComplCache Settings
" " ======================
" " neocomplcache
" " A beter autocomplete system!
" let g:neocomplcache_enable_at_startup = 0
" let g:neocomplcache_enable_camel_case_completion = 1
" let g:neocomplcache_enable_underbar_completion = 1
" let g:neocomplcache_enable_smart_case = 1
" " default # of completions is 100, that's crazy
" let g:neocomplcache_max_list = 5
" " words less than 3 letters long aren't worth completing
" let g:neocomplcache_auto_completion_start_length = 3
" " Map standard Ctrl-N completion to Cmd-Space
" inoremap <D-Space> <C-n>
" " This makes sure we use neocomplcache completefunc instead of
" " the one in rails.vim, otherwise this plugin will crap out
" let g:neocomplcache_force_overwrite_completefunc = 1
" " Define keyword.
" if !exists('g:neocomplcache_keyword_patterns')
"   let g:neocomplcache_keyword_patterns = {}
" endif
" let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" " Enable omni completion.
" autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType ruby          setlocal omnifunc=rubycomplete#Complete
" " Enable heavy omni completion.
" if !exists('g:neocomplcache_omni_patterns')
"   let g:neocomplcache_omni_patterns = {}
" endif
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" " Prevent hanging with python: https://github.com/skwp/dotfiles/issues/163
" let g:neocomplcache_omni_patterns['python'] = ''

" Custom Functions
" ================
"
" Color Scheme Helpers
" Show syntax highlighting groups for word under cursor
" nnoremap <leader>b :call <SID>SynStack()<CR>
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

" noremap <leader>k :call AlignDokuTable()<CR>@p
" noremap <leader>l :call DokuLink()<CR>@l

" RENAME CURRENT FILE
" ===================
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
noremap <leader>n :call RenameFile()<cr>

" RUNNING TESTS
" =============
noremap <leader>t :call RunTestFile()<cr>
noremap <leader>T :call RunNearestTest()<cr>
noremap <leader>a :call RunTests('')<cr>
noremap <leader>c :w\|:!bundle exec cucumber %<cr>
noremap <leader>w :w\|:!script/features --profile @wip<cr>

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(_test.py\|.feature\|_spec.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  if match(a:filename, '\.feature$') != -1
    exec ":!script/features " . a:filename
  else
    if filereadable("script/test")
      exec ":!script/test " . a:filename
    elseif filereadable("Gemfile")
      exec ":!bundle exec rspec --color " . a:filename
    elseif filereadable("runtests.py")
      exec ":!py.test " . a:filename
    else
      exec ":!rspec --color " . a:filename
    end
  end
endfunction

vnoremap <silent> <leader>p :!python -c 'import sys, pprint; pp = pprint.PrettyPrinter(indent=4, width=80).pprint; exec sys.stdin.read()'<cr>

vnoremap <silent> <leader>r :!ruby -e 'require "pp"; eval(STDIN.read())'<cr>

vmap <Enter> <Plug>(EasyAlign)
let g:easy_align_bypass_fold = 1

