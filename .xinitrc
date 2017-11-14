#!/bin/sh

export LC_ALL="pl_PL.UTF-8"
export LC_CTYPE="pl_PL.UTF-8"

xinput set-prop "trackpoint" "Device Accel Constant Deceleration" 0.2
xset b off

xbacklight -set 0
xsetroot -solid '#056'

#setxkbmap -option grp:switch,grp:ctrl_shift_l_toggle,grp_led:-scroll pl,gb
setxkbmap -option '' pl,gb

#exec icewm || exec xterm -fg red

exec icewm-session

