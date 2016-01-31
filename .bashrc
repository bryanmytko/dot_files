#  _              _                        __ _ _
# | |__  __ _ ___| |__    _ __  _ __ ___  / _(_) | ___
# | '_ \ / _` / __| '_ \  | '_ \| '__/ _ \| |_| | |/ _ \
  # | |_) | (_| \__ \ | | | | |_) | | | (_) |  _| | |  __/
# |_.__/ \__,_|___/_| |_| | .__/|_|  \___/|_| |_|_|\___|
#                         |_|

# When Bash starts, it executes the commands in this script
# http://en.wikipedia.org/wiki/Bash_(Unix_shell)

# Written by Philip Lamplugh, Instructor General Assembly (2013-2015)
# Updated by PJ Hughes, Instructor General Assembly (2013-2015)
# Updated by Keyan Bagheri, Instructor General Assembly (2015)

# =====================
# Resources
# =====================

# http://cli.learncodethehardway.org/bash_cheat_sheet.pdf
# http://ss64.com/bash/syntax-prompt.html
# https://dougbarton.us/Bash/Bash-prompts.html
# http://sage.ucsc.edu/xtal/iterm_tab_customization.html

# ====================
# TOC
# ====================
# --------------------
# System Settings
# --------------------
#  Path
#  Settings
#  History
#  Aliases
#  Change System Settings
# --------------------
# Application Settings
# --------------------
#  Application Aliases
#  rbenv
#  nvm
# --------------------
# Other Settings
# --------------------
#  Functions
#  Sourced Files
#  Environmental Variables and API Keys

# =================
# Path
# =================

# A list of all directories in which to look for commands,
# scripts and programs
PATH="$HOME/.rbenv/bin:$PATH"                              # RBENV
PATH="/usr/local/bin:/usr/local/sbin:$PATH"                # Homebrew
PATH="/usr/local/heroku/bin:$PATH"                         # Heroku Toolbelt
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"       # Coreutils
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH" # Manual pages

# =================
# Settings
# =================

# Prefer US English
export LC_ALL="en_US.UTF-8"
# use UTF-8
export LANG="en_US"

# # Adds colors to LS!!!!
# export CLICOLOR=1
# # http://geoff.greer.fm/lscolors/
# # Describes what color to use for which attribute (files, folders etc.)
# export LSCOLORS=exfxcxdxbxegedabagacad # PJ: turned off
# export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"

# =================
# History
# =================

# http://jorge.fbarr.net/2011/03/24/making-your-bash-history-more-efficient/
# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE

# don't put duplicate lines in the history.
export HISTCONTROL=ignoredups

# ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# Make some commands not show up in history
export HISTIGNORE="h"

# ====================
# Aliases
# ====================

## 'ls' lists information about files.
# By default, show slashes for directories.
alias ls='ls -F'

# Enhanced ls, grouping directories and using colors.
alias lf='ls --color -h --group-directories-first -F'

# Long list format including hidden files and file information.
alias ll='ls --color -h --group-directories-first -Fla'

# List ACLs (finer-grained permissions that can be inherited).
# ACLs are a necessary part of OSX fs since 10.6; see
# - ACLs on OSX: https://goo.gl/PhkcA2
# - OSX chmod manpage: https://goo.gl/vJqgZ9
#
# Note: The default ls on 10.7+ OSX is the GNU coreutils version at:
# /usr/local/opt/coreutils/libexec/gnubin/ls; in order to see the
# ACL permissions, we must use the BSD version available at: /bin/ls
alias lacl='/bin/ls -GFlae'

# Go back one directory
alias b='cd ..'

# History lists your previously entered commands
alias h='history'

# If we make a change to our bash profile we need to reload it
alias reload="clear; source ~/.bash_profile"

# Execute verbosely
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias mkdir='mkdir -pv'

# =================
# Change System Settings
# =================

# Hide/show all desktop icons (useful when presenting)
alias hide_desktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias show_desktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Hide/show hidden files in Finder
alias hide_files="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias show_files="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"

# ================
# Application Aliases
# ================

# Sublime should be symlinked. Otherwise use one of these
# alias subl='open -a "Sublime Text"'
# alias subl='open -a "Sublime Text 2"'
alias chrome='open -a "Google Chrome"'

# =================
# rbenv
# =================

# start rbenv (our Ruby environment and version manager) on open
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# =================
# nvm (load io.js as node)
# =================

export NVM_DIR=~/.nvm
# source ~/.nvm/nvm.sh
# nvm use stable > /dev/null # PJ: using .nvmrc to set this... uncomment if not working

# =================
# Functions
# =================

#######################################
# Quick Jump To Today's WDI Folder
# See the script for usage.
#######################################

# if [ -f ~/.bash_wdi_command.sh ]; then
#   source ~/.bash_wdi_command.sh
# fi

#######################################
# Set ACL permissions to inherit and
# allow read, write and update actions.
#
# Arguments:
#   1. Group Name
#   2. Directory Path
#######################################

allow_group() {
  local GROUP_NAME="$1"
  local TARGET_DIR="$2"
  local PERMISSIONS="read,write,delete,add_file,add_subdirectory"
  local INHERITANCE="file_inherit,directory_inherit"

  sudo mkdir -p "$TARGET_DIR"
  sudo /bin/chmod -R -N "$TARGET_DIR"
  sudo /bin/chmod -R +a "group:$GROUP_NAME:allow $PERMISSIONS,$INHERITANCE" "$TARGET_DIR"
}

#######################################
# Start an HTTP server from a directory
# Arguments:
#  Port (optional)
#######################################

server() {
  local port="${1:-8000}"
  (sleep 2 && open "http://localhost:${port}/")&

  # Simple Pythong Server:
  # python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"

  # Simple Ruby Webrick Server:
  ruby -e "require 'webrick';server = WEBrick::HTTPServer.new(:Port=>${port},:DocumentRoot=>Dir::pwd );trap('INT'){ server.shutdown };server.start"
}

#######################################
# List any open internet sockets on
# several popular ports. Useful if a
# rogue server is running.
# - http://www.akadia.com/services/lsof_intro.html
# - http://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers
#
# No Arguments.
#######################################

rogue() {
  # add or remove ports to check here!
  local PORTS="3000 4567 6379 8000 8888 27017"
  local MESSAGE="> Checking for processes on ports"
  local COMMAND="lsof"

  for PORT in $PORTS; do
    MESSAGE="${MESSAGE} ${PORT},"
    COMMAND="${COMMAND} -i TCP:${PORT}"
  done

  echo "${MESSAGE%?}..."
  local OUTPUT="$(${COMMAND})"

  if [ -z "$OUTPUT" ]; then
    echo "> Nothing running!"
  else
    echo "> Processes found:"
    printf "\n$OUTPUT\n\n"
    echo "> Use the 'kill' command with the 'PID' of any process you want to quit."
    echo
  fi
}

# =================
# Tab Improvements
# =================

## PJ: Might not need?

## Tab improvements
# bind 'set completion-ignore-case on'
# # make completions appear immediately after pressing TAB once
# bind 'set show-all-if-ambiguous on'
# bind 'TAB: menu-complete'

# =================
# Sourced Scripts
# =================

# Builds the prompt with git branch notifications.
if [ -f ~/.bash_prompt.sh ]; then
  source ~/.bash_prompt.sh
fi

# A welcome prompt with stats for sanity checks
if [ -f ~/.welcome_prompt.sh ]; then
  source ~/.welcome_prompt.sh
fi

# bash/zsh completion support for core Git.
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

# ====================================
# Environmental Variables and API Keys
# ====================================

# Below here is an area for other commands added by outside programs or
# commands. Attempt to reserve this area for their use!
##########################################################################

export HOMEBREW_EDITOR=vim
export NODE_REPL_HISTORY_FILE=~/.node_repl_history


#################################################################
################### My actual bashrc ############################

alias tmuxn='tmux new-session -s'
alias tmuxc=tmuxc
alias pgstart='postgres -D /usr/local/var/postgres'

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
alias zoolander='cd ~/code/zoolander'

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

export PATH=/usr/local/bin/npm:$PATH
export PATH=/Users/bryan/.node/bin:$PATH

## Prompt
# PS1="$ "
# source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

source ~/.git-prompt/git-prompt.sh
PS1='\[\e[1;33m\]\w\[\e[0;39m\]\n\[\e[1;32m\]\u\[\e[0;39m\]\[\e[0;39m\]\[\e[1;35m\]$(__git_ps1 " (%s)")\[\e[0;39m\]\[\e[0;39m\] '

# PATH="/usr/local/share/npm/bin:$PATH"                      # NPM
# export PATH=/usr/local/share/npm/bin:$PATH
