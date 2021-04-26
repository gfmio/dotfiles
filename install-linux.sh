#!/bin/sh

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPT_DIR=$(dirname "$SCRIPT")

BASE_DIR=$SCRIPT_DIR
FILES_DIR="$BASE_DIR/files";
MACOS_FILES_DIR="$FILES_DIR/linux";
HOME_DIR="$MACOS_FILES_DIR/home";
ROOT_DIR="$MACOS_FILES_DIR";

backupOldFile() {
  local FILE=$1

  BACKUP_FILE="$FILE.backup"
  if test -e $FILE -o -L $FILE; then
    if test -e $BACKUP_FILE -o -L $BACKUP_FILE; then
      backupOldFile $BACKUP_FILE
    fi
    echo "Backing up $FILE";
    mv -n $FILE $FILE.backup;
  fi
}

linkFile() {
  local FROM=$1
  local TO=$2

  backupOldFile $TO
  echo "Linking $FROM to $TO";
  ln -s $FROM $TO;
}

sourceFile() {
  local SOURCED_FILE=$1
  local TARGET_FILE=$2

  backupOldFile $TARGET_FILE
  echo "Sourcing $SOURCED_FILE in $TARGET_FILE"
  echo "source \"$SOURCED_FILE\"" >> $TARGET_FILE;
}

copyFile() {
  local FROM=$1
  local TO=$2

  backupOldFile $TO
  echo "Moving $FROM to $TO";
  cp -r -n $FROM $TO;
}

linkHome() {
  local FILE=$1
  linkFile $HOME_DIR/$FILE ~/$FILE
}

sourceHome() {
  local FILE=$1
  sourceFile $HOME_DIR/$FILE ~/$FILE
}

copyHome() {
  local FILE=$1
  copyFile $HOME_DIR/$FILE ~/$FILE
}

linkRoot() {
  local FILE=$1
  linkFile $ROOT_DIR/$FILE /$FILE
}

sourceRoot() {
  local FILE=$1
  sourceFile $ROOT_DIR/$FILE /$FILE
}

copyRoot() {
  local FILE=$1
  copyFile $ROOT_DIR/$FILE /$FILE
}

install_amix_vimrc() {
  if test ! -e ~/.vim_runtime; then
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
  fi
}

main() {
  linkHome .config/i3
  linkHome .config/i3blocks
  linkHome .config/i3status
  linkHome .config/sway
  linkHome .config/termite
  linkHome .config/picom
  linkHome .config/pikaur.conf

  linkHome .screenlayout
  linkHome .gitconfig

  sourceHome .bashrc
  sourceHome .bash_profile
  sourceHome .bash_logout
  sourceHome .zlogin
  sourceHome .zlogout
  sourceHome .zprofile
  sourceHome .zshenv
  sourceHome .zshrc

  linkHome .gitconfig
  linkHome .hammerspoon/init.lua

  linkHome .xinitrc
  linkHome .Xresources

  copyRoot etc/greetd/config.toml
  copyRoot etc/greetd/environments
  copyRoot etc/greetd/i3-config
  copyRoot etc/greetd/sway-config

  install_amix_vimrc
}

main
