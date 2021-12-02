#!/bin/bash

# Include cargo programs
PATH=~/.cargo/bin:$PATH

themes="$@"
hc=~/.config

flags=""

for theme in $themes; do
    flags+="-e $theme "
done

corpl $hc/picom/picom.conf $hc/i3/config $hc/dunst/dunstrc $hc/kitty/kitty.conf $flags
corpl $hc/rofi/colors.rasi --comment "/*" --closing-comment "*/" $flags
i3-msg restart
systemctl --user restart dunst

# Do polybar later, so i3 had time to restart
corpl $hc/polybar/config.ini -c ";" $flags
