" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set runtimepath+=~/.vim/ultisnips_rep

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" do not keep a backup file (file~), use versions instead
set history=100	" keep 100 lines of command line history
set ruler			" show the cursor position all the time
set laststatus=2	" always show the editing status bar at the bottom
set showcmd			" display incomplete commands
set incsearch		" do incremental searching

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

filetype plugin indent on

set autoindent		" always set autoindenting on

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set foldmethod=syntax
set foldlevel=99

set number				" line numbering
set tabstop=4			" set tabs to 3 spaces
set shiftwidth=4		"

set linebreak 			" wrap on words rather than characters
set textwidth=75	" insert EOL after 75 columns
" set wrap				" wrap text at the edge of the window
"
set t_Co=256 			" set 256 color terminal
"colors beauty256
colors molokai
"colors lettuce
"colors gardener
"colors koehler			" good 16 color scheme
set guifont=Inconsolata\ 16
set visualbell
set t_vb=

setlocal spell spelllang=en_us		" set the spellcheck to english
set mousemodel=popup_setpos			" set the right click in gvim to spellcheck

set thesaurus+=~/.vim/mthesaur-vim.txt
" set iskeyword+=32,- " This messes up syntax highlighting

set ignorecase
set wildmenu

" make misspelled words appear underlined
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=11 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" F9 will turn spell checking on or off in normal and insert mode
map <F9> :setlocal spell! spelllang=en_us<cr>
imap <F9> <ESC>:setlocal spell! spelllang=en_us<cr>i

" pressing tab twice will move to the next tab
map <tab><tab> :tabn<cr>
map <s-Tab><s-Tab> :tabprevious<cr>
" pressing space twice will move to the next split and maximize
map <space><space> <c-W>w<c-W>_

" F10 to make and view a latex pdf
map <F10> :w<CR>:!make clean; make `basename % .tex`; evince `basename % .tex`.pdf &<cr>
imap <F10> <ESC>:w<CR>:!make clean; make `basename % .tex`; evince `basename % .tex`.pdf &<cr>

" Removes trailing spaces
function! TrimWhiteSpace()
: %s/\s\s*$//gc
: ''
:endfunction
map <silent> <F3>  :call TrimWhiteSpace()<CR>
imap <silent> <F3> <ESC>:call TrimWhiteSpace()<CR>i

" Save key
map <F4> :w<CR>
imap <F4> <ESC>:w<CR>i

" Netrw settings
let g:netrw_winsize=30
let g:netrw_liststyle=3
let g:netrw_list_hide='.*\.o$'
let g:netrw_browse_split=0

" Open file browser
" map  <F2> :Vexplore<CR>
" imap <F2> <ESC>:Vexplore<CR>
" Edit a file, close the old one
" map  <F3> <CR><c-W><c-W>:wq<CR>
map <F2> :NERDTreeToggle<CR>

" Edit a file, close the old, and reopen browser
"map  <F4> <CR><c-W><c-W>:q!<CR>:Vexplore<CR><c-W><c-W>

map  <F12> :TlistToggle<CR>
imap <F12> <ESC>:TlistToggle<CR>

map <F11> gqip
imap <F11> <ESC>gqip
" map <F11> <ESC>{V}!fmt<CR>}
" imap <F11> <ESC>{V}!fmt<CR>}

" Map shift space to esc
imap jj <Esc>l
"imap <M-Space> <Esc>
"nnoremap <C-space> i
"imap <C-space> <Esc>

"imap <Home> 0
" map <Home> 0
"imap <End> 0
" map <End> 0
"imap <Left> 0
" map <Left> 0
"imap <Right> 0
" map <Right> 0
"imap <Up> 0
" map <Up> 0
"imap <Down> 0
" map <Down> 0

map T :tabe .<CR>
map <M-c> "+y
map <M-v> "+p

autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
autocmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

augroup mkd
autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1


" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L>

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

