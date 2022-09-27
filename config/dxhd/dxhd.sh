#!/bin/sh
#Print
  name=$(date +%F_%H_%M_%S) && maim -u ~/Pictures/screenshot/$name.png && xclip -selection clipboard -t image/png ~/Pictures/screenshot/$name.png

#Print + shift
  name=$(date +%F_%H_%M_%S) && maim -u -s ~/Pictures/screenshot/$name.png && xclip -selection clipboard -t image/png ~/Pictures/screenshot/$name.png

#Print + control
  maim -u ~/Pictures/screenshot/$(date +%F_%H_%M_%S).png

#Print + Alt
  maim -i $(xdotool getactivewindow) | xclip -selection clipboard -t image/png

#super + {minus,equal}
  i3-volume -n {down,up} 5

#super + m
  alacritty --class bookmarker,bookmarker -e ~/.scripts/mark.sh
#super + Return
  alacritty
#super +d
  rofi -show combi
#super +c
  rofi -modi "clipboard:greenclip print" -show clipboard -run-command '{cmd}'
#super + f
  firescreen
