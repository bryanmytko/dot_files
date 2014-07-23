alias bx='bundle exec'
alias tmuxn='tmux new-session -s'
alias tmuxc=tmuxc
alias pgstart='postgres -D /usr/local/var/postgres'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

tmuxc(){
  if [ -z "$1" ]
    then
      echo 'You need to set a session name'
      return
  fi
  if [ -f ~/.tmux-$1 ]
  then
    sh ~/.tmux-$1
  else
    echo "There ain't no config file for $1."
  fi
}
