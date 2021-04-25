#
# linux/home/.zshenv
#

export PATH="/usr/local/bin:$PATH"

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPT_DIR=$(dirname "$SCRIPT")
# source file if exists
sourceife() {
  [[ -f $1 ]] && . $1
}
# update load order
__THIS_FILE__="linux/home/.zshenv"
# echo $__THIS_FILE__
export __LOAD_ORDER__="$__LOAD_ORDER__ $__THIS_FILE__"

sourceife $SCRIPT_DIR/../../common/home/.env
sourceife $SCRIPT_DIR/../../common/home/.zshenv
sourceife $SCRIPT_DIR/.env

# linux-specific .zshenv options