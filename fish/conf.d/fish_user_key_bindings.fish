function fish_user_key_bindings
  # Default Bindings
  #   Alt+Up or Down to move through last argument history
  #   Alt+Left or Right to move through dirhist

  # Alt+Ctrl+n or e to move through last argument history
  bind \e\cn history-token-search-forward
  bind \e\ce history-token-search-backward
  bind -M insert \e\cn history-token-search-forward
  bind -M insert \e\ce history-token-search-backward

  # Alt+Ctrl+h or l to move through dirhist
  bind \e\ch prevd-or-backward-word
  bind \e\cl nextd-or-forward-word
  bind -M insert \e\ch prevd-or-backward-word
  bind -M insert \e\cl nextd-or-forward-word

  # Ctrl-e accept current completion
  bind -M insert \ce forward-char

  # sync history accross sessions before reverse history search
  bind -k up 'history --merge; up-or-search'
  bind -M insert -k up 'history --merge; up-or-search'

  # Also Use Ctrl-p and Ctrl-n for reverse history search
  bind -M insert \cp 'history --merge; up-or-search'
  bind -M insert \cn down-or-search
  bind \cp 'history --merge; up-or-search'
  bind \cn down-or-search
end
