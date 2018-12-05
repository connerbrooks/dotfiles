#!/bin/zsh

dotfiles_dir=${0:A:h}
home_dir=~

cd $home_dir
echo 'Linking files from $dotfiles_dir to $home_dir'

for dotfile in zshrc vimrc tmux.conf
do
    echo "Linking\n\t $dotfiles_dir/$dotfile -> $home_dir/.$dotfile" 
    ln -s $dotfiles_dir/$dotfile .$dotfile
done

