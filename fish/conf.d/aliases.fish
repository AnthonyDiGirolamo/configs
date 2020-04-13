alias lltr='ll -tr'
alias llsr='ll -Sr'
alias lla='ls -lha'
alias ll='ls -lh'
alias la='ls -a'
alias l='ls -CF'

alias gll='git log --abbrev-commit --graph --decorate --date=relative --all --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\''
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
alias o=prevd
alias d=dirh
alias pd=prevd
alias nd=nextd

function h --description "merge history from other sessions and display with less"
  history --merge
  history
end

function setgitauthor
  git config user.name "AnthonyDiGirolamo"
  git config user.email "anthony.digirolamo@gmail.com"
end

alias v='vim'
alias tmux='tmux -2'

if string match -q -r 'Darwin' (uname -a)
  alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
end

alias ew="emacs-w32 &"
alias e="emacs -nw"
alias eg="emacs &"
alias ed="emacs --daemon"
alias ec="emacsclient --alternate-editor='' -nw"
alias ecg="emacsclient --alternate-editor='' --no-wait --create-frame"
