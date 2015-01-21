alias tmuxn='tmux new-session -s'
alias tmuxc=tmuxc
alias pgstart='postgres -D /usr/local/var/postgres'

# alias vim='/usr/local/Cellar/vim/7.4.430/bin/vim'

alias bx='bundle exec'
alias g='git'
alias gaa='g add -A'
alias gcm='g commit -m'
alias gs='g status'
alias gcb='g checkout -b'
alias gfu='g fetch upstream'
alias gm='g merge'
alias u='cd ../'
alias rc='rails console'
alias rs='rails server'
alias bi='bundle install'
alias v='vim'
alias mysqlstart='mysql.server start'

alias dcheck='grep debugger -ri'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

tmuxc(){
  if [ -z "$1" ]
    then
      echo 'You need to set a session name'
      return
  fi
  if [ -f ~/.tmux/config/.tmux-$1 ]
  then
    sh ~/.tmux/config/.tmux-$1
  else
    echo "There ain't no config file for $1."
  fi
}

## Prompt
source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
PS1='\[\e[1;33m\]\w\[\e[0;39m\]\n\[\e[1;32m\]\u\[\e[0;39m\]\[\e[0;39m\]\e[1;35m\]$(__git_ps1 " (%s)")\[\e[0;39m\]\[\e[0;39m\] '
