" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup     " do not keep a backup file (file~), use versions instead
set history=1000 " keep 1000 lines of command line history
set ruler        " show the cursor position all the time
set laststatus=2 " always show the editing status bar at the bottom
set showcmd      " display incomplete commands
set incsearch    " do incremental searching

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

filetype plugin indent on

augroup htmlerb
au BufNewFile,BufRead *.html.erb set ft=html.eruby.eruby-rails
au BufNewFile,BufRead *.html.erb set syntax=eruby
au BufNewFile,BufRead *.html.erb set expandtab
au BufNewFile,BufRead *.html.erb set shiftwidth=2
au BufNewFile,BufRead *.html.erb set tabstop=2
au BufNewFile,BufRead *.less set ft=css
augroup END

set autoindent        " always set autoindenting on

set foldmethod=syntax
set foldlevel=99

set number            " line numbering
set tabstop=4         " set tabs to 3 spaces
set shiftwidth=4

set linebreak         " wrap on words rather than characters
set textwidth=75      " insert EOL after 75 columns

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  set t_Co=256 " set 256 color terminal
  syntax on
  set hlsearch
endif

if has('gui_running')
	colors warm_grey
	set guifont=Inconsolata\ 16
	set guioptions=aegimtT
	set visualbell
	set vb t_vb=
else
	colors molokai
endif

setlocal spell spelllang=en_us		" set the spellcheck to english
set mousemodel=popup_setpos			" set the right click in gvim to spellcheck

" F9 will turn spell checking on or off in normal and insert mode
map <F9> :setlocal spell! spelllang=en_us<cr>
imap <F9> <ESC>:setlocal spell! spelllang=en_us<cr>i

" Thesaurus
set thesaurus+=~/.vim/mthesaur-vim.txt.gz
" This will consider spaces and -'s as part of words in the thesaurus file
" Really messes up syntax highlighting though
" set iskeyword+=32,-

set ignorecase
set wildmenu

" make misspelled words appear underlined and yellow
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=11 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

imap <C-O> <C-X><C-O>

" pressing tab twice will move to the next tab
map <tab><tab> :tabn<cr>
map <s-Tab><s-Tab> :tabprevious<cr>
" pressing space twice will move to the next split and maximize
map <space><space> <c-W>w<c-W>_

" F10 to make and view a latex pdf
"map <F10> :w<CR>:!make clean; make `basename % .tex`; evince `basename % .tex`.pdf &<cr>
"imap <F10> <ESC>:w<CR>:!make clean; make `basename % .tex`; evince `basename % .tex`.pdf &<cr>

" Removes trailing spaces
function! TrimWhiteSpace()
: %s/\s\s*$//g
: ''
:endfunction
map <silent> <F3>  :call TrimWhiteSpace()<CR>
imap <silent> <F3> <ESC>:call TrimWhiteSpace()<CR>i

" Clear trailing whitespace before a save
autocmd BufWritePre * :%s/\s\+$//e

" Save key
map <F4> :w<CR>
imap <F4> <ESC>:w<CR>i

" Netrw settings
"let g:netrw_winsize=30
"let g:netrw_liststyle=3
"let g:netrw_list_hide='.*\.o$'
"let g:netrw_browse_split=0

" Open file browser
" map  <F2> :Vexplore<CR>
" imap <F2> <ESC>:Vexplore<CR>
" Edit a file, close the old one
" map  <F3> <CR><c-W><c-W>:wq<CR>

" Edit a file, close the old, and reopen browser
"map  <F4> <CR><c-W><c-W>:q!<CR>:Vexplore<CR><c-W><c-W>

" Above netrw settings replaced by using nerdtree
map <F2> :NERDTreeToggle<CR>

" Symbol listing - requires ctags
map  <F12> :TlistToggle<CR>
imap <F12> <ESC>:TlistToggle<CR>

" Format a paragraph nicely
map <F11> gqip
imap <F11> <ESC>gqip
" Same as above using fmt
" map <F11> <ESC>{V}!fmt<CR>}
" imap <F11> <ESC>{V}!fmt<CR>}

" Map shift space to esc
imap jj <Esc>l
"imap <M-Space> <Esc>
"nnoremap <C-space> i
"imap <C-space> <Esc>

map T :tabe .<CR>

" Alt-C and V copy and paste to and from the system clipboard
map <M-c> "+y
map <M-v> "+p

" Trying to get better syntax highlighting for python
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
autocmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Syntax coloring for markdown files (.mkd)
augroup mkd
autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END

" Rails plugin options
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1


" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L>

" VIM as a GTD to-do list
function! InsertDate(spaces)
	let today = strftime("%m/%d")
	let pattern = "\s*$"
	let line = getline(".")

	let repl = ""
	for i in range(80-strlen(line)-strlen(today)-a:spaces)
		let repl .= " "
	endfor
	let repl .= today

	let newline = substitute(line, pattern, repl, "")
	call setline(".", newline)
endfunction

function! RemoveTask()
	:s/^\s*[\*-] \[ \] //
	:s/\s*\d\d.\d\d$//
endfunction

function! NewTask()
	:s/^\s*/\* \[ \] /
	call InsertDate(0)
endfunction

function! SubTask()
	:s/^\s*/\t- \[ \] /
	call InsertDate(3)
endfunction

function! MarkDone()
	try
		:s/\[ \]/\[x\]/
	catch
		:s/\[x\]/\[ \]/
	endtry
endfunction

nmap <silent> ;a :call NewTask()<CR>
nmap <silent> ;s :call SubTask()<CR>
nmap <silent> ;d :call MarkDone()<CR>
nmap <silent> ;D :call RemoveTask()<CR>

" Determine the color scheme name of whatever the cursor is under
"map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
"\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
"\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Fuzzy Find Shortcut
nnoremap <silent> <C-y> :tabnew<CR>:FufFile **/<CR>

" Ignore whitespace in vimdiff
set diffopt+=iwhite

source ~/.vimrc_private

