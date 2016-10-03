function fish_prompt
  # printf '[%s]%s %s@%s %s⮀ %s %s⮀%s %s ' $vi_mode (set_color -b black) (whoami) (hostname|cut -d .  -f 1) (set_color -b blue black) (prompt_pwd) (set_color -b normal blue) (set_color normal)
  # printf ' %s %s %s%s %s ' (set_color -b blue black) (prompt_pwd) (set_color -b normal blue) (set_color normal)
  printf '%s%s %s⮀%s %s ' (set_color -b blue black) (prompt_pwd) (set_color -b normal blue) (set_color normal)
end

fish_vi_key_bindings

# The fish_mode_prompt function is prepended to the prompt
function fish_mode_prompt --description "Displays the current mode"
  # Do nothing if not in vi mode
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    switch $fish_bind_mode
      case default
        set_color --bold --background red white
        echo ' N '
        set_color --background blue red
        echo '⮀ '
      case insert
        set_color --bold --background green white
        echo ' I '
        set_color --background blue green
        echo '⮀ '
      case replace-one
        set_color --bold --background green white
        echo ' R '
        set_color --background blue green
        echo '⮀ '
      case visual
        set_color --bold --background magenta white
        echo ' V '
        set_color --background blue magenta
        echo '⮀ '
    end
    set_color normal
    # echo -n ' '
  end
end

# function pd
#   pushd $argv
# end
# function d
# dirs | sed -e 's/  */\
# /g'
# end
# function o
#   popd
# end

function o
  prevd
end
function d
  dirh
end


function dl
  for dir in $dirprev
    echo $dir
  end
  for dir in $dirnext
    echo $dir
  end
end

bind \cp prevd-or-backward-word
bind \cn nextd-or-forward-word
