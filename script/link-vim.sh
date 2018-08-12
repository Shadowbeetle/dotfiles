#!/usr/bin/env bash

# Usage: ./link-git.sh

CURR_DIR=$(pwd)
PROJECTS_DIR=~/Projects/src/github.com/Shadowbeetle/dotfiles
cd ~
ln -sf $PROJECTS_DIR/dot-vimrc.symlink .vimrc
cd $CURR_DIR
