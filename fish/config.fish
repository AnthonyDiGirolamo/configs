function fish_title
  true
end

if set -q INSIDE_EMACS
  fish_default_key_bindings
else
  fish_vi_key_bindings
end

function add_directory_to_path --argument-names new_dir
  if test -d $new_dir
    set -x PATH $new_dir $PATH
  end
end

# Prepend PATH variable
add_directory_to_path /usr/local/go/bin
add_directory_to_path $HOME/.local/bin
add_directory_to_path $HOME/.rbenv/bin
add_directory_to_path $HOME/.cargo/bin
add_directory_to_path $HOME/.luarocks/bin
add_directory_to_path $HOME/.npm-packages/bin

# This breaks some things
# set -x SHELL fish

# Example of using emacsclient as EDITOR
# if which emacsclient 1>/dev/null
#   if test -z $DISPLAY
#       # no display
#       set -x EDITOR "emacsclient --alternate-editor='' -nw"
#   else
#       # display set
#       set -x EDITOR "emacsclient --alternate-editor='' --no-wait --create-frame"
#   end
# end

# Use Vim, it's faster for this use case
set -x EDITOR "vim"
set -x VISUAL $EDITOR
if not set -q INSIDE_EMACS
    set -x TERM xterm-24bit
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

set config_local $HOME/.config/fish/config-local.fish
test -f $config_local; and source $config_local
