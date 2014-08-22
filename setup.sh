#!/bin/bash
# Setup for dotfiles on OSX

dir=~/dotfiles
files="vimrc zshrc"

# Change to dotfiles directory
echo "Change to dotfiles directory."
cd $dir

# Symlink files to home directory
echo "Symlinking files..."
for file in $files; do
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done

# Setup Vundle and install bundles
echo "Installing Vundle and Bundles"
if [[ ! -d ~/.vim/bundle/Vundle.vim/ ]]; then
  git clone git://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qa
fi

# Install oh-my-zsh
echo "Installing oh-my-zsh"
if [[ ! -d ~/.oh-my-zsh/ ]]; then
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

# Change default shell to zsh
if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
  chsh -s $(which zsh)
fi


