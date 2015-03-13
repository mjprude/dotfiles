#  _               _                        __ _ _
# | |__   __ _ ___| |__    _ __  _ __ ___  / _(_) | ___
# | '_ \ / _` / __| '_ \  | '_ \| '__/ _ \| |_| | |/ _ \
# | |_) | (_| \__ \ | | | | |_) | | | (_) |  _| | |  __/
# |_.__/ \__,_|___/_| |_| | .__/|_|  \___/|_| |_|_|\___|
#                         |_|

# When Bash starts, it executes the commands in this script
# http://en.wikipedia.org/wiki/Bash_(Unix_shell)

# Written by Philip Lamplugh, Instructor General Assembly (2013)
# Updated by PJ Hughes, Instructor General Assembly (2013)

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
#  Path List
#  Settings
#  History
#  Aliases
#  Other System Settings
# --------------------
# Application Settings
# --------------------
#  Application Aliases
#  rbenv
# --------------------
# Other Settings
# --------------------
#  Shortcuts
#  Source Files
#  Environmental Variables and API Keys
#  Colophon

# -----------------------------------------------------------------------------
# Path
# A list of all directories in which to look for commands, scripts and programs
# -----------------------------------------------------------------------------

PATH="$HOME/.rbenv/bin:$PATH"                              # RBENV
PATH="/usr/local/share/npm/bin:$PATH"                      # NPM
PATH="/usr/local/bin:/usr/local/sbin:$PATH"                # Homebrew
PATH="/usr/local/heroku/bin:$PATH"                        # Heroku Toolbelt
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"      # Coreutils
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH" # Manual pages
PATH="/usr/local/bin/pear:$PATH"                           # PEAR

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

# LS lists information about files.
# show slashes for directories.
alias ls='ls -F --color'

# long list format including hidden files and include unit size
alias ll='ls -la'

# History lists your previously entered commands
alias h='history'

# If we make a change to our bash profile we need to reload it
alias reload="clear; source ~/.bash_profile"

# confirm before executing and be verbose
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'

# =================
# Additional Aliases
# =================

# Hide/show all desktop icons (useful when presenting)
alias hide_desktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias show_desktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Hide/show hidden files in Finder
alias hide_files="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias show_files="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"

# List any open internet sockets on several popular ports.
# Useful if a rogue server is running
# http://www.akadia.com/services/lsof_intro.html
# http://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers
alias rogue='lsof -i TCP:3000 -i TCP:4567 -i TCP:8000 -i TCP:8888 -i TCP:6379'

# =================
# Michael's Aliases
# =================

# alias sin='mkdir public public/stylesheets views; touch app.rb Gemfile config.ru views/layout.erb views/index.erb public/stylesheets/styles.css; echo -e "source '\''https://rubygems.org'\''\n\ngem '\''pry'\''\ngem '\''sinatra'\''\ngem '\''sinatra-activerecord'\''\ngem '\''sinatra-reloader'\''\ngem '\''pg'\''" >> Gemfile; echo -e "require '\''./app.rb'\''\nrun Sinatra::Application" >> config.ru; echo -e "require '\''bundler'\''\nBundler.require" >> app.rb; bundle; subl .;'

# ===== Grab Vendor Assets =====
getjqueryfunc() {
  if [[ $# -eq 0 ]] ; then
    cp ~/src/vendor/jquery-1.11.1.min.js ~/src/vendor/jquery-1.11.1.min.map .
    return
  else
    cp ~/src/vendor/jquery-1.11.1.min.js ~/src/vendor/jquery-1.11.1.min.map $1
  fi
}
alias getjquery=getjqueryfunc

getbackbonefunc() {
  if [[ $# -eq 0 ]] ; then
    cp ~/src/vendor/backbone-1.1.2.min.js ~/src/vendor/backbone-1.1.2.min.map .
    return
  else
    cp ~/src/vendor/backbone-1.1.2.min.js ~/src/vendor/backbone-1.1.2.min.map $1
  fi
}
alias getbackbone=getbackbonefunc

gethandlebarsfunc() {
  if [[ $# -eq 0 ]] ; then
    cp ~/src/vendor/handlebars-v2.0.0.js .
    return
  else
    cp ~/src/vendor/handlebars-v2.0.0.js $1
  fi
}
alias gethandlebars=gethandlebarsfunc

getunderscorefunc() {
  if [[ $# -eq 0 ]] ; then
    cp ~/src/vendor/underscore-1.7.0.min.js ~/src/vendor/underscore-min.map .
    return
  else
    cp ~/src/vendor/underscore-1.7.0.min.js ~/src/vendor/underscore-min.map $1
  fi
}
alias getunderscore=getunderscorefunc

getd3func() {
  if [[ $# -eq 0 ]] ; then
    cp ~/src/vendor/d3-3.5.2.min.js .
    return
  else
    cp ~/src/vendor/d3-3.5.2.min.js $1
  fi
}
alias getd3=getd3func
#=====
makemove() {
  mkdir $1
  cd $1
}

alias mm=makemove

projectcdfunc() {
  if [[ $# -eq 0 ]] ; then
    cd ~/src/projects
    return
  else
    cd ~/src/projects/$1
  fi
}

alias proj=projectcdfunc
alias src='cd ~/src'
alias workbench='cd ~/src/workbench'

# ===== git commands ===== #
alias push='git push origin master'
alias pull='git pull origin master'
alias pullu='git pull upstream master'


# ===== boilerplate sinatra app ===== #

sinatracrudfunc() {
  cp -r ~/src/sinatra_template/. .

  for var in "$@"
    do
    touch lib/"$var.rb"
    # "class ${var^} \< ActiveRecord::Base\nend" >> lib/"$var.rb"
    mkdir views/"$var"
    cd views/"$var"
    touch index.erb new.erb edit.erb show.erb
    cd ../..
  done
  ruby app_helper.rb $1 $2
  rm -f app_helper.rb
  bundle
  subl .
}

alias sin=sinatracrudfunc

##from matt

cdwdifunc() {
  if [[ $# -eq 0 ]] ; then
    cd ~/src/wdi_nyc_sept_2014_lemur/
    return
  fi

  if [ $1 -lt 10 ]
  then
    cd ~/src/wdi_nyc_sept_2014_lemur/w0$1/d0$2/${3:-Michael_Prude}
  elif [ $1 -ge 10 -a $1 -le 14 ]
  then
    cd ~/src/wdi_nyc_sept_2014_lemur/w$1/d0$2/${3:-Michael_Prude}
  else
    cd ~/src/wdi_nyc_sept_2014_lemur/${3:-Michael_Prude}
  fi
}
alias lemur=cdwdifunc

rackfunc() {
  open -a "Google Chrome" "http://localhost:9292"
  bundle exec rackup
  # rack_pid=$!
  # sleep 1
  # wait $rack_pid
  # kill rack_pid
}

alias rack=rackfunc

# ================
# Rails Aliases
# ================
alias brake='bin/rake'
alias brails='bin/rails'

# ================
# Application Aliases
# ================

# Sublime should be symlinked. Otherwise use one of these
# alias subl='open -a "Sublime Text"'
# alias subl='open -a "Sublime Text 2"'
alias chrome='open -a "Google Chrome"'

# Chrome 3000 Port Open...
alias c3po='open -a "Google Chrome" "http://localhost:3000"'

# =================
# rbenv
# =================

# start rbenv (our Ruby environment and version manager) on open
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# =================
# Functions
# =================

#######################################
# Start an HTTP server from a directory
# Arguments:
#  Port (optional)
#######################################

server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)

  # Simple Pythong Server:
  # python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"

  # Simple Ruby Webrick Server:
  ruby -e "require 'webrick';server = WEBrick::HTTPServer.new(:Port=>${port},:DocumentRoot=>Dir::pwd );trap('INT'){ server.shutdown };server.start"
}

# =================
# Tab Improvements
# =================

## Tab improvements
# ## Might not need?
bind 'set completion-ignore-case on'
# # make completions appear immediately after pressing TAB once
bind 'set show-all-if-ambiguous on'
bind 'TAB: menu-complete'

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


export MAPBOX=pk.eyJ1IjoibWpwcnVkZSIsImEiOiJiVG8yR2VrIn0.jtdF6eqGIKKs0To4p0mu0Q
export MTA_REALTIME_API_KEY=7ee207fa92377e2914017c410fdc2119
export BXD_APP_ID=457768067340-pvd9a1mklg1r4b399adqtria0ho9t865.apps.googleusercontent.com
export BXD_APP_SECRET=hnHES7U3bbZQuskoE-A-XIdX
export GOOGLE_API_KEY=AIzaSyALxnVM0U1DoQyI2sCmxkU6nkB2lWMMRok
export WHOSAMPLED_API_KEY=ERJOYW4FPYDOLNHBN 
export WHOSAMPLED_CONSUMER_KEY=7c00ad774fc175eb2e3c2ea7394ed158
export WHOSAMPLED_SHARED_SECRET=2Cqqegx3QIO5NMcSUWpqUg
# alias livetrain="ssh root@104.236.108.50" #password: livetrain
alias livetrain='ssh root@104.131.206.60'
alias livetrain2="ssh root@162.243.8.208"
alias live="cd ~/src/projects/livetrain_api"
alias livefront="cd ~/src/projects/livetrain_client"
# Below here is an area for other commands added by outside programs or
# commands. Attempt to reserve this area for their use!
##########################################################################
