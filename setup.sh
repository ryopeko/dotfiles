#!/bin/sh

cd $HOME
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

cd $HOME/dotfiles

cp ryopeko.zsh ~/.oh-my-zsh/custom/

dotfiles=(`find . -name "dot.*"`)

for file in ${dotfiles[@]};
do
  new=`echo "$file" | sed s/.\\\/dot//g`;
  cmd="ln -snf $PWD/dot$new ~/$new"

  echo $cmd
  eval $cmd
done

source ~/.zshrc
