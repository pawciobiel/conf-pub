#!/usr/bin/bash


setxkbmap pl

# /usr/bin/xrandr --output LVDS-1 --primary --mode 1600x900 --auto
#/usr/bin/xrandr --output LVDS-1 --primary --auto --output VGA-1 --left-of LVDS-1 --auto
/usr/bin/xrandr --output LVDS-1 --primary --mode 1368x768 --output VGA-1 --left-of LVDS-1 --auto

#emacs -nw --daemon
synclient TouchpadOff=1
