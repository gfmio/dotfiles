#
# linux/home/.profile
#

__THIS_FILE__="linux/home/.profile"
# echo $__THIS_FILE__
export __LOAD_ORDER__="$__LOAD_ORDER__ $__THIS_FILE__"

export XKB_DEFAULT_RULES=evdev
export XKB_DEFAULT_MODEL=pc105
export XKB_DEFAULT_LAYOUT=us
export XKB_DEFAULT_VARIANT=altgr-intl
export XKB_DEFAULT_OPTIONS=lv3:ralt_switch_multikey
# setxkbmap -rules evdev -model pc105 -layout gb -variant mac
