#
# common/home/.profile
#

__THIS_FILE__="common/home/.profile"
# echo $__THIS_FILE__
export __LOAD_ORDER__="$__LOAD_ORDER__ $__THIS_FILE__"

# pyenv (almost not noticeable quick)
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"
