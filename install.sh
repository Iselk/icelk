#!/bin/bash

echo "Some of the files has me (icelk) as a hardcoded user, mostly in ssh and /home/icelk."
echo "The file \"icelk-specific.txt\" contains all files I'm hardcoded in, and where."

echo

echo "Warning: You must be in the dotfile's root directory when running this script."
echo "Warning: This folder should be in a permanent place before running this script."
echo "This script will not create or remove any folders/files. If errors appear, nothing has been overriden."
read -p "Press enter to continue or Ctrl+C to exit..."

shopt -s expand_aliases

echo "Add the -f flag to the following line in this script to override any present files. Can be used after moving the dotfiles directory."
alias l="ln -s"
wdc="$PWD/config"
wdh="$PWD/home"
hc=~/.config

##-------
# Config
##-------

## VSCodium
l $wdc/VSCodium/User/keybindings.json $hc/VSCodium/User/
l $wdc/VSCodium/User/settings.json $hc/VSCodium/User/
l $wdc/vscode.json $hc/.vscode/settings.json

## Dunst
l $wdc/dunstrc $hc/dunst/

## Clipcat
l $wdc/clipcat/ $hc/clipcat

## Fish
l $wdc/fish/ $hc/fish

## Gtk
l $wdc/gtk-3.0.ini $hc/gtk-3.0/

## i3
l $wdc/i3 $hc/i3/config

## Kitty
l $wdc/kitty.conf $hc/kitty/kitty.conf

## NeoVim
l $wdc/nvim/init.vim $hc/nvim/
l $wdc/nvim/coc-settings.json $hc/nvim/
l $wdc/nvim/snippets $hc/coc/ultisnips

## Picom
l $wdc/picom.conf $hc/picom/

## Polybar
l $wdc/polybar.ini $hc/polybar/config.ini

## Rofi
l $wdc/rofi/ $hc/rofi

## Spotifyd
l $wdc/spotifyd.conf $hc/spotifyd/

## Systemd
l $wdc/systemd/ $hc/systemd/user

## Starship
l $wdc/starship.toml $hc/

## Thunar
l $wdc/thunar-uca.xml $hc/Thunar/uca.xml

##--------
# Scripts
##--------

l $PWD/scripts/ ~/scripts


##---------
# Packages
##---------

l $PWD/packages/ ~/packages

##-----------
# Home files
##-----------

l $wdh/aliases ~/.aliases
l $wdh/gitconfig ~/.gitconfig
l $wdh/gtkrc-2.0 ~/.gtkrc-2.0
l $wdh/profile ~/.profile
l $wdh/xinitrc ~/.xinitrc
l $wdh/zprofile ~/.zprofile
l $wdh/zshrc ~/.zshrc
l $wdh/Config-files.txt ~/
l $wdh/Reminder.txt ~/
l $wdh/Xmodmap ~/.Xmodmap
l $wdh/vim-things.md ~/

## Backup exclude
l $wdh/Exclude-backup.txt ~/
l $wdh/Exclude-backup-archive.txt ~/
l $wdh/Exclude-backup-usr-share.txt ~/
l $wdh/Exclude-backup-win.txt ~/
