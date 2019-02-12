#!/bin/zsh

dotfiles_dir=${0:A:h}
home_dir=~

cd $home_dir
print -P %F{cyan}"Linking files from $dotfiles_dir to $home_dir"%f

for dotfile in zshenv zshrc vimrc tmux.conf compton.conf xsession conkyrc gtkrc-2.0
do
    file_with_dot=.$dotfile
    if [[ -a $file_with_dot ]]; then
        print -P %F{yellow}'Already linked' $dotfile%f
    else
        print -P %F{cyan}"[Linking] $dotfiles_dir/$dotfile -> $home_dir/.$dotfile"%f
        ln -s $dotfiles_dir/$dotfile .$dotfile
    fi
done
