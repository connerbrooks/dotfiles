#!/bin/sh
# sets up nvidia drivers and my core tools

echo  "Performing minimal xubuntu setup"
sudo ubuntu-drivers autoinstall
sudo apt-get install zsh vim git curl conky compton

if [ $SHELL != $(which zsh) ]; then
    echo 'Changing shell...'
    chsh -s $(which zsh)
else
    echo "Zsh is already the default shell."
fi

