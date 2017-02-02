function fish_title
  true
end

# Bindings
# Defaults:
#   Alt+Up or Down to move through last argument history
#   Alt+Left or Right to move through dirhist

function fish_user_key_bindings
  # Alt+n or e to move through last argument history
  bind \e\cn history-token-search-forward
  bind \e\ce history-token-search-backward
  # Alt+h or l to move through dirhist
  bind \e\ch prevd-or-backward-word
  bind \e\cl nextd-or-forward-word
end

# if not set -q INSIDE_EMACS
#   # turn on vi mode
#   fish_vi_key_bindings
# end

# Prompt Setup
set using_android 0
if string match -q -r 'Android' (uname -a)
  set using_android 1
end

set powerline_right_arrow ''
if string match -q -r 'chip' (uname -a)
  set powerline_right_arrow ''
end

set powerline_insert 5f5fff
set powerline_blue1 5f87ff
set powerline_blue2 87afff
set powerline_blue3 dfdfff

function fish_prompt
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

  if test -d .git
    set_color -b $powerline_blue3 $powerline_blue2
    echo -n $powerline_right_arrow

    set_color -b $powerline_blue3 black
    echo -n '' (git rev-parse --abbrev-ref HEAD) ''

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

function set-my-aliases
  # aliases
  alias lltr='ll -tr'
  alias llsr='ll -Sr'
  alias lla='ls -lha'
  alias ll='ls -lh'
  alias la='ls -a'
  alias l='ls -CF'

  alias e='emacs -nw'
  alias eg='emacs'
  alias v='vim'

  alias gll='git l'
  alias gs='git status'
  alias ga='git add'
  alias gc='git commit'
  alias gca='git commit -a'
  alias gwd='git diff'
  alias gwdc='git diff --cached'
  alias gp='git pull'
  alias gpp='git push'
  alias gco='git checkout'

  # fish specific aliases
  alias u='cd ..'
  alias o=prevd
  alias d=dirh
end
set-my-aliases

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

function h --description "merge history from other sessions and display with less"
  history --merge
  history
end

function source-bash-aliases --description "Try to source bash aliases, not fully working"
  bash -i -c 'alias' > ~/.active_aliases
  for line in (cat ~/.active_aliases) # | grep 'vim\|emacs'
    set_color -b normal $powerline_blue2
    echo $line
    set_color -b normal normal
    eval "$line"
  end
  rm -f ~/.active_aliases
end
