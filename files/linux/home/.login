#
# linux/home/.login
#

__THIS_FILE__="linux/home/.login"
# echo $__THIS_FILE__
export __LOAD_ORDER__="$__LOAD_ORDER__ $__THIS_FILE__"

#
# wayland
#

# if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && [[ -z $XDG_SESSION_TYPE ]]; then
#   XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
# fi

# if [[ -z $WAYLAND_DISPLAY ]]; then
# 	xrandr --output HDMI2 --set audio force-dvi > /dev/null 2>&1
# else
#   xrandr --output XWAYLAND1 --set audio force-dvi
#	  echo "" > /dev/null
# fi

#
# X
#

# Autostart X at login
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  startx
  # sway
fi
