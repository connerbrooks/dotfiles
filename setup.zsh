#!/bin/zsh

dotfiles_dir=${0:A:h}
home_dir=~

pushd $home_dir
echo "Linking files from $dotfiles_dir to $home_dir"

for dotfile in vimrc tmux.conf
do
    echo "Linking $dotfiles_dir/$dotfile -> $home_dir/.$dotfile"
    ln -s $dotfiles_dir/$dotfile .$dotfile
done

if [[ ! -a .czsh ]]; then
    echo 'Linking czsh'
    ln -s $dotfiles_dir/czsh .czsh
else
    echo 'czsh already linked'
fi

if [[ -a .zshrc ]]; then
    if read -q 'choice?Old .zshrc will be moved to .zshrc.old, continue? '; then
        mv .zshrc .zshrc.old
    else
        echo
        echo 'Exiting'
        exit
    fi
fi
echo
echo 'Copying zshrc to home folder.'
cp $dotfiles_dir/zshrc .zshrc

popd


echo "Linking .config/gtk-3.0/settings.ini"
pushd .config/gtk-3.0/
ln -s $dotfiles_dir/settings.ini settings.ini
popd

echo "Linking /usr/share/xsessions/dwm.desktop"
pushd /usr/share/xsessions
ln -s $dotfiles_dir/dwm.desktop dwm.desktop
popd

