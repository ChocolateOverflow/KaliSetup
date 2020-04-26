#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

[ -f ~/.xprofile ] && . ~/.xprofile

# Swap CAPS and ESC keys
setxkbmap -option caps:swapescape

#while :; do
#	ssh-agent dwm || break
#done
#exec dwm
#exec i3
exec bspwm -c $HOME/.config/bspwm/bspwmrc
