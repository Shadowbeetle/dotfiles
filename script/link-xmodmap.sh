#!/usr/bin/env bash

# Usage: ./link-git.sh

CURR_DIR=$(pwd)
PROJECTS_DIR=~/Projects/src/github.com/Shadowbeetle/dotfiles
cd ~
ln -sf $PROJECTS_DIR/linux/dot-Xmodmap.symlink .Xmodmap
cd $CURR_DIR
