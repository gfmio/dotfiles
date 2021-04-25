#
# linux/home/.zprofile
#

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPT_DIR=$(dirname "$SCRIPT")
# source file if exists
sourceife() {
  [[ -f $1 ]] && . $1
}
# update load order
__THIS_FILE__="linux/home/.zprofile"
# echo $__THIS_FILE__
export __LOAD_ORDER__="$__LOAD_ORDER__ $__THIS_FILE__"

sourceife $SCRIPT_DIR/../../common/home/.profile
sourceife $SCRIPT_DIR/../../common/home/.zprofile
sourceife $SCRIPT_DIR/.profile

# linux-specific .zprofile options

# export PATH="$HOME/.cargo/bin:$PATH"
# export PATH="$HOME/.poetry/bin:$PATH"
