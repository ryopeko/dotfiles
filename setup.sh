#!/bin/sh

DOT_HOME=$HOME/dotfiles

cd $HOME
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

cd $DOT_HOME

cp ryopeko.zsh ~/.oh-my-zsh/custom/

dotfiles=(`find . -name "dot.*"`)

for file in ${dotfiles[@]};
do
  new=`echo "$file" | sed s/.\\\/dot//g`;
  cmd="ln -snf $PWD/dot$new ~/$new"

  echo $cmd
  eval $cmd
done

ln -snf $PWD/ryopeko.zsh ~/.oh-my-zsh/custom/ryopeko.zsh

source ~/.zshrc

cd $DOT_HOME/dot.vim/bundle/

git clone git://github.com/gmarik/vundle.git

cd $DOT_HOME
