#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#xrandr --output DVI-I-1 --left-of HDMI-1

xrandr -r 144 &&
xrdb -merge ~/.Xresources &&
xsetroot -cursor_name left_ptr &

xidle -delay 5 -nw -program "/usr/bin/env DISPLAY=:0 XAUTHORITY=/home/thud/.Xauthority /usr/local/bin/slock -c" -timeout 300 &

exec dbus-launch --exit-with-session dwm
