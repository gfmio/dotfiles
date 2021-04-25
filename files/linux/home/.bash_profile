#
# linux/home/.bash_profile
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
__THIS_FILE__="linux/home/.bash_profile"
# echo $__THIS_FILE__
export __LOAD_ORDER__="$__LOAD_ORDER__ $__THIS_FILE__"

# Load env

sourceife $SCRIPT_DIR/../../common/home/.env
sourceife $SCRIPT_DIR/../../common/home/.bash_env
sourceife $SCRIPT_DIR/.env
sourceife $SCRIPT_DIR/.bash_env

# Load profile

sourceife $SCRIPT_DIR/../../common/home/.profile
sourceife $SCRIPT_DIR/../../common/home/.bash_profile
sourceife $SCRIPT_DIR/.profile

# linux-specific .bash_profile options

# Load login

sourceife $SCRIPT_DIR/../../common/home/.login
sourceife $SCRIPT_DIR/../../common/home/.bash_login
sourceife $SCRIPT_DIR/.login
sourceife $SCRIPT_DIR/.bash_login
