function u --description "cd .. or up to a given directory"
  if test (count $argv) = 0
    cd ..
    return 0
  end

  set dir_name $argv[1]
  set d (string split "/$dir_name/" (pwd))
  if test (count $d) = 2
    cd "$d[1]/$dir_name"
    return 0
  else
    return 1
  end
end

function dl --description "always vertical dirh"
  for dir in $dirprev
    echo $dir
  end
  set_color cyan
  echo (pwd)
  set_color normal
  for dir in $dirnext
    echo $dir
  end
end
