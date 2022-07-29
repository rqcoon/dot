#!/bin/sh

killall -9 picom blueman-applet nm-applet

picom &
feh --bg-scale /home/rqc/Downloads/Sources/wallpapers/minimalistic/dark-cat-rosewater.png
nm-applet &
blueman-applet &
