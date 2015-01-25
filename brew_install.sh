#!/bin/bash

brew update

brew tap peco/peco

brew install vim --with-lua

brew_packages=(
zsh
git
hg
tig
tmux
go
peco
ag
jq
wget
tree
redis
imagemagick
)

cask_packages=(
iterm2
keyremap4macbook
google-chrome
google-japanese-ime
chromium
firefox
limechat
istat-menus
alfred
slack
dropbox
bettertouchtool
kobit
evernote
skype
)

for package in ${brew_packages[@]} ; do
  echo "check $package"
  brew list |grep $package
  if [ $? -gt 0 ]; then
     echo "install $package"
     brew install $package
  else
     echo "update $package"
     brew upgrade $package
  fi
done

for package in ${cask_packages[@]}; do
  echo "check $package"
  brew cask list |grep $package
  if [ $? -gt 0 ]; then
     echo "install $package"
     brew cask install $package --verbose
  else
     echo "installed $package"
  fi
done
