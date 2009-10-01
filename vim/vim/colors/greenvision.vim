" Vim color file
" Name: greenvision.vim
" Maintainer: Paul B. Mahol <onemda@No-NoSpaMgmail.com>
" Last Change: $Id: greenvision.vim,v1.2.6 2008/02/12 pbm Exp $
" License: Vim License
" Revision: 10

if !has("gui_running") && &t_Co != 256 && &t_Co != 88
	echomsg ""
	echomsg "err: please use GUI or a 256-color terminal or 88-color terminal"
	echomsg ""
	finish
endif

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'greenvision'

if has("gui_running")
	hi Boolean		guifg=#00c13f guibg=#000000 gui=none
	hi Character		guifg=#00b14a guibg=#000000 gui=bold
	hi Comment		guifg=#007200 guibg=#000000 gui=none
	hi Conditional		guifg=#00a46c guibg=#000000 gui=none
	hi Constant		guifg=#00b72f guibg=#000000 gui=none
	hi Cursor		guifg=#00ff00 gui=bold,reverse
	hi CursorColumn 	guifg=#000000 guibg=#00cc00 gui=none
	hi CursorIM		guifg=#00ff00 guibg=#000000 gui=bold
	hi CursorLine		guifg=#000000 guibg=#00cc00 gui=none
	hi Debug		guifg=#00a422 guibg=#000000 gui=bold
	hi Define		guifg=#36de00 guibg=#000000 gui=none
	hi Delimiter		guifg=#54e200 guibg=#000000 gui=none
	hi DiffAdd		guifg=#00bf00 guibg=#002200 gui=none
	hi DiffChange		guifg=#009900 guibg=#002200 gui=none
	hi DiffDelete		guifg=#000000 guibg=#005500 gui=none
	hi DiffText		guifg=#00aa00 guibg=#004400 gui=underline
	hi Directory		guifg=#00b330 guibg=#000000 gui=none
	hi Error		guifg=#000d00 guibg=#00b000 gui=none
	hi ErrorMsg		guifg=#000000 guibg=#00ff00 gui=none
	hi FoldColumn		guifg=#00a900 guibg=#000600 gui=none
	hi Folded		guifg=#00af00 guibg=#001200 gui=none
	hi Function		guifg=#00f086 guibg=#000900 gui=none
	hi Identifier		guifg=#00c930 guibg=#000000 gui=none
	hi IncSearch		gui=reverse
	hi Label		guifg=#20ff00 guibg=#000000 gui=none
	hi LineNr		guifg=#007a00 guibg=#000800 gui=none
	hi Macro		guifg=#2ae300 guibg=#000000 gui=none
	hi MatchParen		guifg=#003300 guibg=#00ee00 gui=none
	hi ModeMsg		guifg=#00da00 guibg=#000900 gui=none
	hi MoreMsg		guifg=#00d700 guibg=#001000 gui=none
	hi NonText		guifg=#007700 guibg=#001000 gui=none
	hi Normal		guifg=#009900 guibg=#000000 gui=none
	hi Number		guifg=#00da2a guibg=#000000 gui=none
	hi Operator		guifg=#44f330 guibg=#000000 gui=none
	hi Pmenu		guifg=#00bf00 guibg=#000a00 gui=none
	hi PmenuSbar		guifg=#00cc00 guibg=#001c00 gui=none
	hi PmenuSel		guifg=#00ee00 guibg=#002200 gui=none
	hi PreProc		guifg=#009c1c guibg=#000000 gui=none
	hi Question		guifg=#008f00 guibg=#000000 gui=none
	hi Repeat		guifg=#00c700 guibg=#000000 gui=bold
	hi Search		guifg=#001600 guibg=#00bf00 gui=none
	hi Special		guifg=#00c700 guibg=#002200 gui=none
	hi SpecialChar		guifg=#00f400 guibg=#000a00 gui=none
	hi SpecialComment	guifg=#009f00 guibg=#000d00 gui=none
	hi SpecialKey		guifg=#006000 guibg=#001300 gui=none
	hi Statement		guifg=#1fb626 guibg=#000000 gui=none
	hi StatusLine		guifg=#00cc00 guibg=#002800 gui=none
	hi StatusLineNC		guifg=#006a00 guibg=#001800 gui=none
	hi String		guifg=#42ba00 guibg=#000000 gui=none
	hi Structure		guifg=#00d200 guibg=#000000 gui=none
	hi TabLine		guifg=#007f00 guibg=#000000 gui=none
	hi TabLineFill		guifg=#000000 guibg=#000000 gui=none
	hi TabLineSel		guifg=#00b100 guibg=#000000 gui=underline
	hi Tag			guifg=#00d45f guibg=#000000 gui=none
	hi Title		guifg=#009b00 guibg=#000000 gui=bold
	hi Todo			guifg=#000000 guibg=#00dd00 gui=none
	hi Type			guifg=#0fa631 guibg=#000000 gui=none
	hi Typedef		guifg=#008600 guibg=#000000 gui=bold
	hi Underlined		guifg=#00a400 guibg=#000000 gui=underline
	hi VertSplit		guifg=#003900 guibg=#003900 gui=none
	hi Visual		guibg=#000500 gui=reverse
	hi VisualNOS		guibg=#001700 gui=reverse
	hi WarningMsg		guifg=#000000 guibg=#00ff00 gui=none
	hi WildMenu		guifg=#00bb00 guibg=#000000 gui=reverse

elseif &t_Co == 256
	hi Comment	ctermfg=34 ctermbg=0 cterm=none
	hi Constant	ctermfg=41 ctermbg=0 cterm=none
	hi Cursor	ctermfg=10 ctermbg=0 cterm=bold,reverse
	hi CursorColumn ctermfg=0 ctermbg=2 cterm=none
	hi CursorLine	ctermfg=0 ctermbg=2 cterm=none
	hi CursorIM	ctermfg=46 ctermbg=0 cterm=bold
	hi DiffAdd	ctermfg=34 ctermbg=0 cterm=none
	hi DiffChange	ctermfg=40 ctermbg=0 cterm=none
	hi DiffDelete	ctermfg=2 ctermbg=0 cterm=none
	hi DiffText	ctermfg=28 ctermbg=0 cterm=none
	hi Directory	ctermfg=46 ctermbg=22 cterm=none
	hi Error	ctermfg=0 ctermbg=10 cterm=none
	hi ErrorMsg	ctermfg=0 ctermbg=10 cterm=none
	hi FoldColumn	ctermfg=46 ctermbg=232 cterm=none
	hi Folded	ctermfg=10 ctermbg=22 cterm=none
	hi Identifier	ctermfg=28 ctermbg=0 cterm=none
	hi IncSearch	cterm=reverse
	hi LineNr	ctermfg=34 ctermbg=232 cterm=none
	hi MatchParen	ctermfg=10 ctermbg=22 cterm=bold,underline
	hi ModeMsg	ctermfg=2 ctermbg=0 cterm=none
	hi MoreMsg	ctermfg=2 ctermbg=0 cterm=none
	hi Normal	ctermfg=2 ctermbg=0 cterm=none
	hi NonText	ctermfg=22 ctermbg=0 cterm=none
	hi Pmenu	ctermfg=2 ctermbg=0 cterm=none
	hi PmenuSbar	ctermfg=34 ctermbg=22 cterm=none
	hi PmenuSel	ctermfg=10 ctermbg=22 cterm=none
	hi PreProc	ctermfg=47 ctermbg=0 cterm=none
	hi Question	ctermfg=40 ctermbg=0 cterm=none
	hi Search	ctermfg=0 ctermbg=46 cterm=none
	hi Special	ctermfg=2 ctermbg=0 cterm=none
	hi SpecialKey	ctermfg=34 ctermbg=0 cterm=none
	hi Statement	ctermfg=10 ctermbg=0 cterm=none
	hi StatusLine	ctermfg=47 ctermbg=232 cterm=none
	hi StatusLineNC	ctermfg=34 ctermbg=22 cterm=none
	hi TabLine	ctermfg=40 ctermbg=0 cterm=none
	hi TabLineFill	ctermfg=0 ctermbg=0 cterm=none
	hi TabLineSel	ctermfg=46 ctermbg=22 cterm=underline
	hi Title	ctermfg=10 ctermbg=0 cterm=bold
	hi Todo		ctermfg=0 ctermbg=2 cterm=none
	hi Type		ctermfg=46 ctermbg=0 cterm=none
	hi Underlined	ctermfg=2 ctermbg=0 cterm=underline
	hi VertSplit	ctermfg=22 ctermbg=22 cterm=none
	hi Visual	ctermbg=0 cterm=reverse
	hi VisualNOS	ctermbg=22 cterm=reverse
	hi WarningMsg	ctermfg=10 ctermbg=0 cterm=none
	hi WildMenu	ctermfg=0 ctermbg=10 cterm=reverse

elseif &t_Co == 88
	hi Comment	ctermfg=34 ctermbg=0 cterm=none
	hi Cursor	ctermfg=10 ctermbg=0 cterm=bold,reverse
	hi CursorColumn ctermfg=0 ctermbg=2 cterm=none
	hi CursorLine	ctermfg=0 ctermbg=2 cterm=none
	hi CursorIM	ctermfg=46 ctermbg=0 cterm=bold
	hi Constant	ctermfg=41 ctermbg=0 cterm=none
	hi DiffAdd	ctermfg=34 ctermbg=0 cterm=none
	hi DiffChange	ctermfg=40 ctermbg=0 cterm=none
	hi DiffDelete	ctermfg=2 ctermbg=0 cterm=none
	hi DiffText	ctermfg=28 ctermbg=0 cterm=none
	hi Directory	ctermfg=46 ctermbg=22 cterm=none
	hi Error	ctermfg=0 ctermbg=10 cterm=none
	hi ErrorMsg	ctermfg=0 ctermbg=10 cterm=none
	hi Folded	ctermfg=10 ctermbg=22 cterm=none
	hi FoldColumn	ctermfg=47 ctermbg=16 cterm=none
	hi Identifier	ctermfg=28 ctermbg=0 cterm=none
	hi IncSearch	cterm=reverse
	hi LineNr	ctermfg=48 ctermbg=16 cterm=none
	hi MatchParen	ctermfg=10 ctermbg=22 cterm=bold,underline
	hi ModeMsg	ctermfg=2 ctermbg=0 cterm=none
	hi MoreMsg	ctermfg=2 ctermbg=0 cterm=none
	hi Normal	ctermfg=2 ctermbg=0 cterm=none
	hi NonText	ctermfg=22 ctermbg=0 cterm=none
	hi Pmenu	ctermfg=2 ctermbg=0 cterm=none
	hi PmenuSbar	ctermfg=34 ctermbg=22 cterm=none
	hi PmenuSel	ctermfg=10 ctermbg=22 cterm=none
	hi PreProc	ctermfg=47 ctermbg=0 cterm=none
	hi Question	ctermfg=40 ctermbg=0 cterm=none
	hi Search	ctermfg=0 ctermbg=46 cterm=reverse
	hi Special	ctermfg=2 ctermbg=0 cterm=none
	hi SpecialKey	ctermfg=34 ctermbg=0 cterm=none
	hi Statement	ctermfg=10 ctermbg=0 cterm=none
	hi StatusLine	ctermfg=2 ctermbg=22 cterm=none
	hi StatusLineNC	ctermfg=34 ctermbg=22 cterm=none
	hi TabLine	ctermfg=40 ctermbg=0 cterm=none
	hi TabLineFill	ctermfg=0 ctermbg=0 cterm=none
	hi TabLineSel	ctermfg=46 ctermbg=22 cterm=underline
	hi Title	ctermfg=10 ctermbg=0 cterm=bold
	hi Todo		ctermfg=0 ctermbg=2 cterm=none
	hi Type		ctermfg=46 ctermbg=0 cterm=none
	hi Underlined	ctermfg=2 ctermbg=0 cterm=underline
	hi VertSplit	ctermfg=22 ctermbg=22 cterm=none
	hi Visual	ctermbg=0 cterm=reverse
	hi VisualNOS	ctermbg=22 cterm=reverse
	hi WarningMsg	ctermfg=10 ctermbg=0 cterm=none
	hi WildMenu	ctermfg=0 ctermbg=10 cterm=reverse
endif
