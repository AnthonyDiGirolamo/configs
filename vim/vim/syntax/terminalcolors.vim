" if exists("b:current_syntax")
"   finish
" endif

syntax match color0 '\(color0\|black\)'
hi           color0 ctermbg=7 ctermfg=0
syntax match color1 '\(color1\|red\)'
hi           color1 ctermbg=0 ctermfg=1
syntax match color2 '\(color2\|green\)'
hi           color2 ctermbg=0 ctermfg=2
syntax match color3 '\(color3\|yellow\)'
hi           color3 ctermbg=0 ctermfg=3
syntax match color4 '\(color4\|blue\)'
hi           color4 ctermbg=0 ctermfg=4
syntax match color5 '\(color5\|magenta\)'
hi           color5 ctermbg=0 ctermfg=5
syntax match color6 '\(color6\|cyan\)'
hi           color6 ctermbg=0 ctermfg=6
syntax match color7 '\(color7\|white\)'
hi           color7 ctermbg=0 ctermfg=7
syntax match color8 '\(color8\|brightblack\)'
hi           color8 ctermbg=0 ctermfg=8
syntax match color9 '\(color9\|brightred\)'
hi           color9 ctermbg=0 ctermfg=9
syntax match color10 '\(color10\|brightgreen\)'
hi           color10 ctermbg=0 ctermfg=10
syntax match color11 '\(color11\|brightyellow\)'
hi           color11 ctermbg=0 ctermfg=11
syntax match color12 '\(color12\|brightblue\)'
hi           color12 ctermbg=0 ctermfg=12
syntax match color13 '\(color13\|brightmagenta\)'
hi           color13 ctermbg=0 ctermfg=13
syntax match color14 '\(color14\|brightcyan\)'
hi           color14 ctermbg=0 ctermfg=14
syntax match color15 '\(color15\|brightwhite\)'
hi           color15 ctermbg=0 ctermfg=15

" color0  black
" color1  red
" color2  green
" color3  yellow
" color4  blue
" color5  magenta
" color6  cyan
" color7  white
" color8  brightblack
" color9  brightred
" color10 brightgreen
" color11 brightyellow
" color12 brightblue
" color13 brightmagenta
" color14 brightcyan
" color15 brightwhite

let b:current_syntax = "terminalcolors"
