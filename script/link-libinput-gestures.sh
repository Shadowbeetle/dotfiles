#!/usr/bin/env bash
set -x
# Usage: ./link-libinut-gestures.sh

CURR_DIR=$(pwd)
PROJECTS_DIR=~/Projects/src/github.com/Shadowbeetle/dotfiles
cd ~/.config
ln -sf $PROJECTS_DIR/linux/dot-config/libinput-gestures.conf.symlink libinput-gestures.conf
cd $CURR_DIR
