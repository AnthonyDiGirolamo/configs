# . /Users/anthony/Preferences/fish/vi-mode.fish
# function fish_user_key_bindings
#   vi_mode_insert
# end

# function fish_prompt
#   printf '[%s]%s %s@%s %s⮀ %s %s⮀%s %s ' $vi_mode (set_color -b black) (whoami) (hostname|cut -d .  -f 1) (set_color -b blue black) (prompt_pwd) (set_color -b normal blue) (set_color normal)
# end

fish_vi_mode

function pd
  pushd $argv
end

function d
dirs | sed -e 's/  */\
/g'
end

function o
  popd
end

function dl
  for dir in $dirprev
    echo $dir
  end
  for dir in $dirnext
    echo $dir
  end
end
