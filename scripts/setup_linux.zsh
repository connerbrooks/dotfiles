#!/bin/zsh

# install some tools
sudo apt-get install vim git cmake
sudo ubuntu-drivers autoinstall # handle default nvidia drivers


sudo apt-get install discord
# sudo apt-get install dmenu # build my own
# todo add keyboard shortcut
sudo apt-get install numix-icon-theme numix-icon-theme-circle
sudo apt-get install materia-gtk-theme

sudo apt-get install appmenu-gtk3-module appmenu-qt4 vala-panel-appmenu feh plank
sudo apt-get install fonts-powerline

xfconf-query -c xsettings -p /Gtk/ShellShowsMenubar -n -t bool -s true
xfconf-query -c xsettings -p /Gtk/ShellShowsAppmenu -n -t bool -s true

# todo set numix for everything?
# set terminal theme
# ulauncher?

