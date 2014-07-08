#!/bin/sh

DOT_HOME=$HOME/dotfiles

bash $DOT_HOME/brew_install.sh

cd $HOME
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

cd $DOT_HOME

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

git clone https://github.com/Shougo/neobundle.vim

cd $DOT_HOME
