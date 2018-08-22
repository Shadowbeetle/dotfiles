#!/usr/bin/env bash

# Usage: ./link-git.sh

CURR_DIR=$(pwd)
PROJECTS_DIR=~/Projects/src/github.com/Shadowbeetle/dotfiles
cd ~/.config/
ln -sf $PROJECTS_DIR/linux/dot-config/ranger.symlink ranger
cd $CURR_DIR
