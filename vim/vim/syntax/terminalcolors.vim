" if exists("b:current_syntax")
"   finish
" endif

syntax match color0 'black'
hi           color0 ctermfg=7 ctermbg=0
syntax match color1 'red'
hi           color1 ctermfg=8 ctermbg=1
syntax match color2 'green'
hi           color2 ctermfg=8 ctermbg=2
syntax match color3 'yellow'
hi           color3 ctermfg=8 ctermbg=3
syntax match color4 'blue'
hi           color4 ctermfg=8 ctermbg=4
syntax match color5 'magenta'
hi           color5 ctermfg=8 ctermbg=5
syntax match color6 'cyan'
hi           color6 ctermfg=8 ctermbg=6
syntax match color7 'white'
hi           color7 ctermfg=8 ctermbg=7
syntax match color8 'brightblack'
hi           color8 ctermfg=7 ctermbg=8
syntax match color9 'brightred'
hi           color9 ctermfg=8 ctermbg=9
syntax match color10 'brightgreen'
hi           color10 ctermfg=8 ctermbg=10
syntax match color11 'brightyellow'
hi           color11 ctermfg=8 ctermbg=11
syntax match color12 'brightblue'
hi           color12 ctermfg=8 ctermbg=12
syntax match color13 'brightmagenta'
hi           color13 ctermfg=8 ctermbg=13
syntax match color14 'brightcyan'
hi           color14 ctermfg=8 ctermbg=14
syntax match color15 'brightwhite'
hi           color15 ctermfg=8 ctermbg=15

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
