#
# common/home/.bashrc
#

__THIS_FILE__="common/home/.bashrc"
# echo $__THIS_FILE__
export __LOAD_ORDER__="$__LOAD_ORDER__ $__THIS_FILE__"

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# direnv
eval "$(direnv hook bash)"
