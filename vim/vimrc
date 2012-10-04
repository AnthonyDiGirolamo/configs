" Load Pathogen
filetype off
call pathogen#infect()

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

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" In many terminal emulators the mouse works just fine, thus enable it.
" set mouse=a

filetype plugin indent on

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
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

" Better syntax highlighting for python
au FileType python set complete+=k~/.vim/bundle/python_syntax/syntax/python.vim isk+=.,(
au FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

set autoindent


set foldmethod=marker
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

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

"if $TERM == 'xterm-256color'
  set t_Co=256 " set 256 color terminal
  "let g:solarized_termcolors=256
"endif

"set background=light
set background=dark
colors solarized
"colors warm_grey
"colors molokai
"colors fine_blue
"colors mac_classic

if has('gui_running')
  if has("gui_gtk2")
    set guifont=Inconsolata\ 14
  elseif has("gui_macvim")
    set guifont=Inconsolata:h26
  endif
  set guioptions=agm
  "set guioptions=aegimtT
  set visualbell
  set vb t_vb=
endif

setlocal spell spelllang=en_us   " set the spellcheck to english
set mousemodel=popup_setpos      " set the right click in gvim to spellcheck

" F9 will turn spell checking on or off in normal and insert mode
map <F9> :setlocal spell! spelllang=en_us<cr>
imap <F9> <ESC>:setlocal spell! spelllang=en_us<cr>i

" Thesaurus
set thesaurus+=~/.vim/mthesaur-vim.txt
" This will consider spaces and -'s as part of words in the thesaurus file
" Really messes up syntax highlighting though
" set iskeyword+=32,-

set ignorecase

" Allow access to the gvim Menu by hitting F4 in vim
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F4> :emenu <C-Z>

" Scrolling
nmap <C-E> jzz
nmap <C-Y> kzz

" MacVim is flaky with c-x c-*, set c-o to omnicomplete
imap <C-O> <C-X><C-O>

" pressing tab twice will move to the next tab
map <tab><tab> :tabn<cr>
map <s-Tab><s-Tab> :tabprevious<cr>
" pressing space twice will move to the next split
map <space><space> <c-W>w

" F10 to make and view a latex pdf
map <F10> :w<CR>:!make clean; make `basename % .tex`; evince `basename % .tex`.pdf &<cr>
imap <F10> <ESC>:w<CR>:!make clean; make `basename % .tex`; evince `basename % .tex`.pdf &<cr>

" Clear trailing whitespace before a save
autocmd BufWritePre * :%s/\s\+$//e

" Symbol listing - requires ctags
nmap  <F12> :TagbarToggle<CR>

imap jj <Esc>l
" Remap Esc

" Alt-C and V copy and paste to and from the system clipboard
map <M-c> "*y
map <M-v> "*p

" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L>

map T :tabe<CR>
map Y :Explore<CR>

" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e
" " Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" CommandT Settings
" let g:CommandTMaxFiles=2000
set wildignore+=.git,*vendor/cache/*,*vendor/rails/*,*vendor/ruby/*,*/pkg/*,*/tmp/*

let g:user_zen_settings       = { 'erb' : { 'extends' : 'html' } }
let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag    = 1

" Netrw settings
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

" Open file browser
nnoremap <silent> <F2> :NERDTreeToggle<CR>

" Use :C to run a calculation, needs ruby support
:command! -nargs=+ C :ruby puts <args>

"" VIM as a GTD to-do list
"function! InsertDate(spaces)
"  let today = strftime("%m/%d")
"  let pattern = "\s*$"
"  let line = getline(".")
"
"  let repl = ""
"  for i in range(80-strlen(line)-strlen(today)-a:spaces)
"    let repl .= " "
"  endfor
"  let repl .= today
"
"  let newline = substitute(line, pattern, repl, "")
"  call setline(".", newline)
"endfunction
"
"function! RemoveTask()
"  :s/^\s*[\*-] \[ \] //
"  :s/\s*\d\d.\d\d$//
"endfunction
"
"function! NewTask()
"  :s/^\s*/\* \[ \] /
"  call InsertDate(0)
"endfunction
"
"function! SubTask()
"  :s/^\s*/\t- \[ \] /
"  call InsertDate(3)
"endfunction
"
"function! MarkDone()
"  try
"    :s/\[ \]/\[x\]/
"  catch
"    :s/\[x\]/\[ \]/
"  endtry
"endfunction
"
"nmap <silent> ;a :call NewTask()<CR>
"nmap <silent> ;s :call SubTask()<CR>
"nmap <silent> ;d :call MarkDone()<CR>
"nmap <silent> ;D :call RemoveTask()<CR>


" Diff Settings
" Ignore whitespace in vimdiff
set diffopt+=iwhite
"nnoremap <silent> <F3> :%diffget 1<CR>:diffupdate<CR>
"nnoremap <silent> <F4> :%diffget 3<CR>:diffupdate<CR>

" Vim and Grep Helpers
":noautocmd vimgrep /{pattern}/[flags] {file(s)}
"command! -nargs=+ MyGrep execute 'silent grep! <args>' | copen 33
nmap <leader>g :execute " grep -srnw --binary-files=without-match --exclude=tags --exclude-dir=.git --exclude-dir=vendor --exclude-dir=pkg --exclude-dir=html . -e " . expand("<cword>") . " " <bar> cwindow<CR>

" Color Scheme Helpers
" Show syntax highlighting groups for word under cursor
nmap <leader>b :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nmap <leader>b :NeoComplCacheToggle
" NeoComplCache Settings
" imap <C-k> <Plug>(neocomplcache_snippets_expand)
" smap <C-k> <Plug>(neocomplcache_snippets_expand)

"let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3

if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" If the above crashes vim, this forces neocomp to call omnicomplete directly
" if !exists('g:neocomplcache_force_omni_patterns')
"   let g:neocomplcache_force_omni_patterns = {}
" endif
" let g:neocomplcache_force_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

