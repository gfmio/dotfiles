#
# linux/home/.bash_logout
#

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$BASH_SOURCE")
# Absolute path this script is in, thus /home/user/bin
SCRIPT_DIR=$(dirname "$SCRIPT")
# source file if exists
sourceife() {
  [[ -f $1 ]] && . $1
}
# update load order
__THIS_FILE__="linux/home/.bash_logout"
# echo $__THIS_FILE__
export __LOAD_ORDER__="$__LOAD_ORDER__ $__THIS_FILE__"

sourceife $SCRIPT_DIR/../../common/home/.logout
sourceife $SCRIPT_DIR/../../common/home/.bash_logout
sourceife $SCRIPT_DIR/.logout

# linux-specific .bash_logout options
