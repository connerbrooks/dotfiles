[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xset +fp /usr/share/fonts/local
xset fp rehash

# screen powersave
xset +dpms
xset dpms 0 0 300

# Set DWM status bar information with conky
conky | while read -r; do xsetroot -name "$REPLY"; done &

# Fix volume/mute keys (loads .xbindkeysrc) 
xbindkeys &

# fix for java application dwm
wmname LG3D

# map caps lock to escape
setxkbmap -option caps:swapescape

# Disable touchpad for ThinkPad
synclient TouchpadOff=1

exec dwm
