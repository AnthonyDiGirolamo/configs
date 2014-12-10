" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off
call pathogen#incubate()       " Load Pathogen

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

" Airline Settings
" ----------------

let g:airline_theme='murmur'

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
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

let g:tmuxline_separators = {
    \ 'left' : '⮀',
    \ 'left_alt': '⮁',
    \ 'right' : '⮂',
    \ 'right_alt' : '⮃',
    \ 'space' : ' '}

let g:promptline_symbols = {
    \ 'left'       : '⮀',
    \ 'left_alt'   : '⮁',
    \ 'right' : '⮂',
    \ 'right_alt' : '⮃',
    \ 'dir_sep'    : '/',
    \ 'truncation' : '...',
    \ 'vcs_branch' : ' ⭠ ',
    \ 'space'      : ' '}

let g:airline#extensions#promptline#snapshot_file = "~/.shell_prompt.sh"

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
set t_Co=256 " set 256 color terminal

" set background=light
set background=dark
" colors solarized
let base16colorspace=256
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

" Unite Settings
" ==============
let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :<C-u>Unite history/yank<CR>
nnoremap <leader>q :<C-u>Unite -start-insert file_rec/async:!<CR>
nnoremap <leader>a :<C-u>Unite -start-insert grep:.<CR>
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#profile('default', 'context', { 'start_insert': 1, 'winheight': 20, 'direction': 'botright' })
" let g:unite_source_rec_async_command = 'ack -f --nofilter'
let g:unite_source_rec_async_command = 'ag --ignore-dir vendor/ruby --ignore-dir .git --ignore ''*.eot'' --ignore ''*.woff'' --ignore ''*.ttf'' --ignore ''*.svg'' --ignore ''*.gif'' --ignore ''*.png'' --ignore ''*.jpg'' --follow --nocolor --nogroup --hidden -g ""'
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
\ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
\  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''

" CtrlP Settings
" ==============
noremap <leader>M :CtrlPBufTagAll<cr>
noremap <leader>o :silent !ctags -R app/controllers/ app/helpers/ app/indices/ app/mailers/ app/models/ app/views/ lib/<cr>:CtrlPTag<cr>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](env.*|html|\.git|\.hg|\.svn)$',
  \ 'file': '\v\.(pyc|exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_extensions = ['tag', 'buffertag'] ", 'quickfix', 'dir', 'rtscript', 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']

noremap <leader>m :TagbarToggle<cr>

setlocal spell spelllang=en_us   " set the spellcheck to english
noremap <leader>s :setlocal spell! spelllang=en_us<cr>
set nospell

" Macro Keybinding
" nnoremap <leader>d f"wdi"<esc>o<esc>p==kf"dW$bido <esc>o<i class="color-icon-"></i><esc>jo<% end %><esc>
nnoremap <leader>d :diffput<CR>:diffupdate<CR>

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

" Python and Ruby Evals
vnoremap <silent> <leader>P :!python -c 'import sys, pprint; pp = pprint.PrettyPrinter(indent=4, width=80).pprint; exec sys.stdin.read()'<cr>
vnoremap <silent> <leader>R :!ruby -e 'require "pp"; pp(eval(STDIN.read()))'<cr>

vmap <Enter> <Plug>(EasyAlign)
let g:easy_align_bypass_fold = 1

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

" Netrw Settings
" ==============
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

" Color Scheme Helper
" Show syntax highlighting groups for word under cursor
" nnoremap <leader>b :call <SID>SynStack()<CR>
" function! <SID>SynStack()
"   if !exists("*synstack")
"     return
"   endif
"   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfunc

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
noremap <leader>tt :call RunTestFile()<cr>
noremap <leader>tn :call RunNearestTest()<cr>
noremap <leader>tr :call RunTests('')<cr>
noremap <leader>tc :w\|:Dispatch bundle exec cucumber<cr>

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
  " :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  if match(a:filename, '\.feature$') != -1
    exec ":Dispatch bundle exec cucumber " . a:filename
  else
    if filereadable("Gemfile")
      exec ":Dispatch bundle exec rspec --color " . a:filename
    elseif filereadable("runtests.py")
      exec ":Dispatch py.test " . a:filename
    elseif filereadable("script/test")
      exec ":Dispatch script/test " . a:filename
    end
  end
endfunction

