#!/bin/sh

dotfiles=(`find . -name "dot.*"`)

for file in ${dotfiles[@]};
do
  new=`echo "$file" | sed s/.\\\/dot//g`;
  cmd="ln -snf $PWD/dot$new ~/$new"

  echo $cmd
  eval $cmd
done

