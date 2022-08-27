#!/bin/bash

cr=$(tput setaf 1)
cb=$(tput setaf 8)
cc=$(tput sgr0)

echo "Some of the files has me (icelk) as a hardcoded user, mostly in ssh and /home/icelk."
echo "The file \"icelk-specific.txt\" contains all files I'm hardcoded in, and where."

echo

echo "${cr}Warning:${cc} You must be in the dotfile's root directory when running this script."
echo "${cr}Warning:${cc} This folder should be in a permanent place before running this script."
echo
echo "This will not override any files. Use the flag '-f' to see all errors."

read -p "Press enter to continue or Ctrl+C to exit..."

shopt -s expand_aliases

echo "Add the -f flag to the following line in this script to override any present files. Useful if you move this directory."
echo
alias l_cmd="ln -s"
wdc="$PWD/config"
wdh="$PWD/home"
hc=~/.config

printfailed=$(if [[ "$1" == "-f" ]]; then echo yes; fi)

function l {
    from=$1
    to=$2
    if [[ "$from" == "-f" ]]; then
        from="-f $2"
        to="$3"
    fi
    mkdir -p $(dirname $to)
    result=$(l_cmd $from $to 2>&1)
    if [[ "$result" == *"File exists"* && -z $printfailed ]]; then
        # Do nothing
        :
    else
        echo "${cb}$result${cc}" >&2
    fi
}

##-------
# Config
##-------

## Dunst
l $wdc/dunstrc $hc/dunst/

## Cargo
l $wdc/cargo.toml ~/.cargo/config.toml

## Clipcat
l $wdc/clipcat/ $hc/clipcat
mkdir -p ~/.cache/clipcat/clipcatd

## Firefox

l $wdc/firefox-user.js ~/.mozilla/firefox/$(/bin/ls -1 ~/.mozilla/firefox/ | rg --pcre2 "^(?!static-).*\\.default-release" | head -n1)/user.js

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
mkdir -p $hc/nvim/syntax
l /usr/share/nvim/runtime/syntax/typescript.vim $hc/nvim/syntax/javascript.vim
l /usr/share/nvim/runtime/syntax/typescriptcommon.vim $hc/nvim/syntax/
echo "${cb}The snippets are notoriously difficult to install. If you don't have any snippets in neovim, remove the folder at ~/.config/coc/ultisnips and rerun this.${cc}"
l $wdc/nvim/snippets $hc/coc/ultisnips

## Picom
l $wdc/picom.conf $hc/picom/

## Polybar
l $wdc/polybar.ini $hc/polybar/config.ini

## Python

l $wdc/python/ $hc/python

## Rofi
l $wdc/rofi/ $hc/rofi

## rust-analyzer
l ~/.config/coc/extensions/coc-rust-analyzer-data/rust-analyzer ~/.local/bin/rust-analyzer

## Spotifyd
l $wdc/spotifyd.conf $hc/spotifyd/

## SSH
l $wdc/ssh ~/.ssh/config
mkdir -p -m 700 ~/.ssh/sockets

## Starship
l $wdc/starship.toml $hc/

## Systemd
l $wdc/systemd/ $hc/systemd/user

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
# Wallpapers
##-----------

l $PWD/wallpapers/ ~/Pictures/wallpapers

##-----------
# Home files
##-----------

l $wdh/aliases ~/.aliases
l $wdh/gitconfig ~/.gitconfig
l $wdh/gtkrc-2.0 ~/.gtkrc-2.0
l $wdh/profile ~/.profile
l $wdh/xinitrc ~/.xinitrc
l $wdh/xserverrc ~/.xserverrc
l $wdh/zprofile ~/.zprofile
l $wdh/zshrc ~/.zshrc
l $wdh/Config-files.txt ~/
l $wdh/Reminder.txt ~/
l $wdh/Xmodmap ~/.Xmodmap
l $wdh/Xmodmap-alternative ~/.Xmodmap-alternative
l $wdh/vim-things.md ~/

## Backup exclude
l $wdh/Exclude-backup.txt ~/
l $wdh/Exclude-backup-archive.txt ~/
l $wdh/Exclude-backup-usr-share.txt ~/
l $wdh/Exclude-backup-win.txt ~/

# GNOME settings (which libadwaita uses)
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

echo

echo "Enabling user services. Only the hardware-independent are enabled. See this script for the others and the systemd directory."

systemctl --user enable --now xdg-user-dirs-update.service packages-dump.service backup-obsidian.timer check-failed.timer reminder-notify.timer
# Hardware-dependent
# systemctl --user enable --now sync.timer backup.timer

systemctl --user enable --now dbus-broker

echo

echo "Install complete."
echo "Install the wallpapers by running the 'download.sh' script in ~/Pictures/wallpapers."
echo "Install boot themes by running 'install-plymouth-themes.sh'."
