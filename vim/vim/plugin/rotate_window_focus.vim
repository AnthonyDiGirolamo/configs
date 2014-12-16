function! RotateWindowFocus()
  let window_count = winnr('$')
  let current_window = winnr()
  let next_window = current_window + 1
  if next_window > window_count
    let next_window = 1
  endif

  let window_heights = [0]
  windo call add(window_heights, winheight('wnr'))
  let window_widths = [0]
  windo call add(window_widths, winwidth('wnr'))

  exe current_window . "wincmd w"
  set nonumber nowrap
  vertical resize 30

  exe next_window . "wincmd w"
  set number wrap
  if window_heights[current_window] != window_heights[next_window]
    exe "wincmd _"
    exe 5 . "wincmd -"
  endif
endfunction

  " tabnew
  " let max_height = winheight('wnr')
  " let max_width = winwidth('wnr')
  " tabclose

  " let total_width = 0
  " let total_height = 0
  " for i in window_heights
  "   let total_height += i
  " endfor
  " for i in window_widths
  "   let total_width += i
  " endfor

  " echo total_height total_width

  " echo current_window
  " echo next_window
  " echo window_heights[window_count]
  " echo window_heights[next_window]
  " echo window_heights[current_window] == window_heights[next_window]

  " if window_heights[current_window] == window_heights[next_window]
  "   " exe current_window . ',30' . "wincmd |"
  "   vertical resize 30
  " endif

  " if window_widths[current_window] < window_widths[next_window]
  "   resize 6
  " endif
  " execute "normal! \<ctrl-w>" . next_window . "w"
