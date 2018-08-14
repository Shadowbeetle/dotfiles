#!/usr/bin/env bash

# Usage: ./link-git.sh

CURR_DIR=$(pwd)
PROJECTS_DIR=~/Projects/src/github.com/Shadowbeetle/dotfiles
cd ~/.config/albert
ln -sf $PROJECTS_DIR/linux/dot-config/albert/albert.conf.symlink albert.conf
cd $CURR_DIR
