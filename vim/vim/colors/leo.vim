" Vim color file
" Maintainer:		Lorenzo Leonini <vim-theme[a]leonini[o]net>
" Last Change:	2008 Jul 2
" URL:					http://www.leonini.net

" Description:
" A colored, contrasted theme for long programming sessions.
" For 256-colors term (xterm, Eterm, konsole, gnome-terminal, ...)
" Very good with Ruby, C, Lua, PHP, ... (but no language specific settings)
" !!! No GUI version

" Note:
" If your term report 8 colors (but is 256 capable), put 'set t_Co=256'
" in your .vimrc

" Tips:
" :verbose hi StatusLine
" Color numbers (0-255) see:
"		http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html

if has("gui_running")
  echomsg "err: Not a GUI theme (only for 256-colors terminals)."
	echomsg ""
  finish
else
	if &t_Co != 256
		echomsg "err: Please use a 256-colors terminal (so that t_Co=256 could be set)."
		echomsg ""
		finish
	end
endif

let g:colors_name = "leo256"

set background=dark
if version > 580
	highlight clear
	if exists("syntax_on")
		syntax reset
	endif
endif

" Normal should come first
hi Normal				cterm=none		ctermfg=15		ctermbg=0

hi CursorLine		cterm=none		ctermbg=233
hi DiffAdd			cterm=none		ctermbg=235
hi DiffChange		cterm=none		ctermbg=234
hi DiffDelete		cterm=none		ctermfg=239		ctermbg=244
hi DiffText			cterm=bold		ctermfg=15		ctermbg=196
hi Directory		cterm=none		ctermfg=196
hi ErrorMsg			cterm=none		ctermfg=15		ctermbg=1
hi FoldColumn		cterm=none		ctermfg=40		ctermbg=248
hi Folded				cterm=none		ctermfg=15		ctermbg=237
hi IncSearch		cterm=reverse
hi LineNr				cterm=none		ctermfg=250
hi ModeMsg			cterm=bold
hi MoreMsg			cterm=none		ctermfg=2
hi NonText			cterm=none		ctermfg=12
hi PmenuSel			cterm=none		ctermfg=15		ctermbg=4
hi Question			cterm=none		ctermfg=2
hi Search				cterm=none		ctermfg=none	ctermbg=11
hi SpecialKey		cterm=none		ctermfg=124
hi StatusLine		cterm=none		ctermfg=0			ctermbg=252
hi StatusLineNC	cterm=none		ctermfg=245		ctermbg=235
hi Title				cterm=none		ctermfg=5
hi VertSplit		cterm=none		ctermfg=233		ctermbg=233
hi Visual				cterm=reverse								ctermbg=none
hi VisualNOS		cterm=underline,bold
hi WarningMsg		cterm=none		ctermfg=1
hi WildMenu			cterm=none		ctermfg=0			ctermbg=11

hi Boolean			cterm=none		ctermfg=135
hi Character		cterm=none		ctermfg=184
hi Comment			cterm=none		ctermfg=246
hi Constant			cterm=none		ctermfg=yellow
hi Conditional	cterm=none		ctermfg=154
hi Define				cterm=bold		ctermfg=27
hi Delimiter		cterm=none		ctermfg=196
hi Exception		cterm=bold		ctermfg=226
hi Error				cterm=none		ctermfg=15		ctermbg=9
hi Keyword			cterm=none		ctermfg=red
hi Function			cterm=none		ctermfg=202
hi Identifier		cterm=none		ctermfg=27
hi Number				cterm=none		ctermfg=135
hi Operator			cterm=none		ctermfg=11
hi PreProc			cterm=none		ctermfg=178
hi Special			cterm=none		ctermfg=206		ctermbg=234
hi Statement		cterm=none		ctermfg=2
hi String				cterm=none		ctermfg=224		ctermbg=234
hi Todo         cterm=none		ctermfg=0			ctermbg=11
hi Type					cterm=none		ctermfg=75
