set -x fish_color_history_current yellow

# Prompt Setup
set using_android 0
if string match -q -r 'Android' (uname -a)
  set using_android 1
end

set powerline_right_arrow ''
if set -q INSIDE_EMACS; or string match -q -r 'raspberrypi|chip' (uname -a)
  set powerline_right_arrow ''
end

set powerline_insert 5f5fff
set powerline_blue1 5f87ff
set powerline_blue2 87afff
set powerline_blue3 dfdfff

function fish_prompt
  if set -q INSIDE_EMACS
    echo -n (prompt_pwd) ' $ '
    return
  end

  set_color -b $powerline_blue1 black
  if test 1 != $using_android
    printf ' %s@%s ' (whoami) (hostname|cut -d .  -f 1)
  else
    echo -n ' '
  end

  set_color -b $powerline_blue2 $powerline_blue1
  echo -n $powerline_right_arrow

  set_color -b $powerline_blue2 black
  echo -n '' (prompt_pwd) ''

  # if test -e .git
  if set branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)
    set_color -b $powerline_blue3 $powerline_blue2
    echo -n $powerline_right_arrow

    set_color -b $powerline_blue3 black
    echo -n '' $branch ''

    set_color -b normal $powerline_blue3
    echo -n $powerline_right_arrow
  else
    set_color -b normal $powerline_blue2
    echo -n $powerline_right_arrow
  end

  echo -n ' '
  set_color normal
end

# The fish_mode_prompt function is prepended to the prompt
function fish_mode_prompt --description "Displays the current mode"
  # Do nothing if not in vi mode
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    switch $fish_bind_mode
      case default
        set_color --bold --background red white
        echo ' N '
        set_color --background $powerline_blue1 red
      case insert
        set_color --bold --background $powerline_insert white
        echo ' I '
        set_color --background $powerline_blue1 $powerline_insert
      case replace-one
        set_color --bold --background green white
        echo ' R '
        set_color --background $powerline_blue1 green
      case visual
        set_color --bold --background magenta white
        echo ' V '
        set_color --background $powerline_blue1 magenta
    end
    echo $powerline_right_arrow
  end
    set_color normal
end
