#!/bin/sh

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(greadlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPT_DIR=$(dirname "$SCRIPT")

BASE_DIR=$SCRIPT_DIR
FILES_DIR="$BASE_DIR/files";
MACOS_FILES_DIR="$FILES_DIR/macos";
HOME_DIR="$MACOS_FILES_DIR/home";

backupOldFile() {
  local FILE=$1

  BACKUP_FILE="$FILE.backup"
  if [[ -f $FILE ]]; then
    if [[ -f $BACKUP_FILE ]]; then
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

main() {
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
}

main
