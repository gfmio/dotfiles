#
# macos/home/.profile
#

__THIS_FILE__="macos/home/.profile"
# echo $__THIS_FILE__
export __LOAD_ORDER__="$__LOAD_ORDER__ $__THIS_FILE__"

# Brew
eval $(brew shellenv)

# Vagrant
export VAGRANT_DEFAULT_PROVIDER=vmware_desktop
