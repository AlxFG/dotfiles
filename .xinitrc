xrdb -load ~/.config/X11/xresources
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
polkit-dumb-agent&
xset dpms 1500 1500 1500
xset s 1500
mpd&
syncthing --no-browser&
udiskie&
sxhkd&
dunst&
stalonetray -c ~/.config/stalone_dwm&
nm-applet --no-agent&
keepassxc&
steam -silent&
clipit -d&
greenclip daemon&
feh --bg-fill ~/Pictures/Fanart/57749465_p0.png
feh --bg-fill ~/Pictures/Wallpaper/ryougi_saber.jpg
~/.scripts/update.lua&
unclutter --timeout 20&
$TERMINAL -e calc&
exec bspwm

