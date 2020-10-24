#!/bin/sh

export LANG="pl_PL.UTF-8"
export LC_ALL="pl_PL.UTF-8"
export LC_CTYPE="pl_PL.UTF-8"

#setxkbmap -option 'grp:switch,grp:ctrl_shift_l_toggle,grp_led:-scroll' pl,gb
setxkbmap -option '' pl

xrdb -merge $HOME/.Xresources

# xev
# jak coś się spapra z xkbmap i ALT_L to nie mapuje ALT_L
#xmodmap -e "clear `xmodmap | grep ALT_L | cut -d' ' -f1`"
#xmodmap <<-EOF
#keycode 22  =  BackSpace osfBackSpace
#keycode 107 =  Delete
#EOF

xinput set-prop /dev/wsmouse "Device Accel Constant Deceleration" 0.25

xset m 1 0

# disable system beep
xset b off

/usr/X11R6/bin/xbacklight -set 40

# background ustawione w icewm theme przez icewmbg
#xsetroot -solid '#056'
xsetroot -solid DarkGreen
#/usr/local/bin/openbsd-wallpaper

# lock screen after 30m of inactivity
xidle -timeout 1800 &

exec icewm-session || exec xterm -fg red
