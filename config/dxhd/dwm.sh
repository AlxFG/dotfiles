#!/bin/sh
#Print
  name=$(date +%F_%H_%M_%S) && maim -u ~/Pictures/screenshot/$name.png && xclip -selection clipboard -t image/png ~/Pictures/screenshot/$name.png

#Print + shift
  name=$(date +%F_%H_%M_%S) && maim -u -s ~/Pictures/screenshot/$name.png && xclip -selection clipboard -t image/png ~/Pictures/screenshot/$name.png

#Print + control
  maim -u ~/Pictures/screenshot/$(date +%F_%H_%M_%S).png

#Print + Alt
  maim -i $(xdotool getactivewindow) | xclip -selection clipboard -t image/png

#super + v
  notify-send Volume $(~/.gits/candies/volume-pulse/bin/volume-pulse)% -t 1000

#super + {minus,equal}
  amixer -D pulse sset Master {5%-,5%+} && notify-send Volume $(~/.gits/candies/volume-pulse/bin/volume-pulse)% -t 1000 -r 6969420

#super + m
  alacritty --class bookmarker,bookmarker -e ~/.scripts/mark.sh

#super + Return
  alacritty

#super +d
  dmenu_run

#super +c
  rofi -modi "clipboard:greenclip print" -show clipboard -run-command '{cmd}'


