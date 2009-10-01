hi clear
set background=light
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'gray256.vim'

hi Normal gui=none ctermfg=0 ctermbg=255

hi Cursor ctermfg=231 ctermbg=16
hi LineNr gui=bold ctermfg=244 ctermbg=7
hi NonText gui=bold ctermfg=7 ctermbg=7
hi SpecialKey term=bold ctermfg=4
hi Title term=bold ctermfg=5 guifg=RoyalBlue4
hi Visual term=reverse ctermbg=153 guibg=#829db9
hi Ignore ctermfg=bg guifg=bg

hi FoldColumn ctermbg=7 ctermfg=4
hi Folded  ctermbg=7 ctermfg=244

hi StatusLine   ctermfg=255         ctermbg=240         cterm=None
hi StatusLineNC ctermfg=255         ctermbg=250         cterm=None
hi VertSplit    ctermfg=254         ctermbg=254         cterm=None
hi TabLine      ctermfg=245         ctermbg=254         cterm=None
hi TabLineFill  ctermfg=254         ctermbg=254         cterm=None
hi TabLineSel   ctermfg=255         ctermbg=240         cterm=Bold

hi Wildmenu 	ctermfg=0 ctermbg=11
"hi CursorLine 	ctermbg=255
hi Pmenu gui=none 	ctermfg=250 ctermbg=238
hi PmenuSbar gui=none 	ctermbg=214
hi PmenuSel gui=none 	ctermbg=214 ctermfg=16
hi PmenuThumb gui=none 	cterm=reverse

hi IncSearch gui=none cterm=reverse
hi Search gui=none ctermbg=11

hi MoreMsg gui=bold guifg=ForestGreen
hi Question gui=bold guifg=ForestGreen
hi WarningMsg gui=bold guifg=Red

hi Comment gui=italic ctermfg=245
hi Error gui=none ctermfg=15 ctermbg=197
hi Identifier gui=none ctermfg=94
hi Special gui=none ctermfg=69
hi PreProc gui=none ctermfg=12
hi Todo gui=bold ctermbg=214 ctermbg=232
hi Type gui=bold ctermfg=62
hi Underlined gui=underline guifg=Blue
hi Directory ctermfg=132
hi Pmenu ctermfg=250 ctermbg=238
hi PmenuSel ctermbg=214 ctermfg=16

hi Boolean gui=bold guifg=ForestGreen
hi Constant gui=none guifg=ForestGreen
hi Number gui=bold guifg=ForestGreen
hi String gui=none ctermfg=2
hi helpNote ctermbg=220 ctermfg=16

hi Label gui=bold,underline guifg=Sienna4
hi Statement gui=bold ctermfg=132
hi htmlStatement ctermfg=132

hi htmlBold gui=bold
hi htmlItalic gui=italic
hi htmlUnderline gui=underline
hi htmlBoldItalic gui=bold,italic
hi htmlBoldUnderline gui=bold,underline
hi htmlBoldUnderlineItalic gui=bold,underline,italic
hi htmlUnderlineItalic gui=underline,italic

hi djangoStatement ctermbg=150 ctermfg=22
hi docSpecial guifg=RoyalBlue1
hi docTrans guifg=White
hi docCode guifg=#00aa00
