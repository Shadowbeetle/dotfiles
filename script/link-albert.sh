#!/usr/bin/env bash

# Usage: ./link-git.sh

CURR_DIR=$(pwd)
PROJECTS_DIR=/home/nazgul/Projects/src/github.com/Shadowbeetle/dotfiles
cd ~/.config
ln -sf $PROJECTS_DIR/linux/dot-config/albert.symlink albert
cd $CURR_DIR
