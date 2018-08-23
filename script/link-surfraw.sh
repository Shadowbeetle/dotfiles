#!/usr/bin/env bash

# Usage: ./link-git.sh

CURR_DIR=$(pwd)
PROJECTS_DIR=~/Projects/src/github.com/Shadowbeetle/dotfiles
mkdir -p ~/.config/surfraw
cd ~/.config/surfraw
ln -sf $PROJECTS_DIR/linux/dot-config/surfraw/conf.symlink conf 
cd $CURR_DIR
