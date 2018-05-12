#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
git config --global user.name mjprude
git config --global user.email michaelprude@gmail.com
brew install vim
cd $HOME/dotfiles && ./install
brew install tmux
brew install reattach-to-user-namespace
brew install the_silver_searcher
defaults write com.apple.finder AppleShowAllFiles YES # show dotfiles in finder
defaults write NSGlobalDomain KeyRepeat -int 1 # increase key-repeat speed
