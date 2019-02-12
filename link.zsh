#!/bin/zsh

dotfiles_dir=${0:A:h}
home_dir=~

cd $home_dir
echo 'Linking files from $dotfiles_dir to $home_dir'

for dotfile in zshenv zshrc vimrc tmux.conf compton.conf xsession conkyrc gtkrc-2.0
do
    echo "Linking\n\t $dotfiles_dir/$dotfile -> $home_dir/.$dotfile" 
    ln -s $dotfiles_dir/$dotfile .$dotfile
done

print -P '%F{cyan}Changing shell...%f'
if [ $SHELL != $(which zsh) ]; then
    chsh -s $(which zsh)
fi

