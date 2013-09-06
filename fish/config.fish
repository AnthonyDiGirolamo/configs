function fish_prompt
  printf '%s %s@%s %s⮀ %s %s⮀%s ' (set_color -b black) (whoami) (hostname|cut -d .  -f 1) (set_color -b blue black) (prompt_pwd) (set_color -b normal blue) (set_color normal)
end

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
