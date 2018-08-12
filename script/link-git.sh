#!/usr/bin/env bash

# Usage: ./link-git.sh

OS=

if [ "$(uname)" == "Darwin" ]; then
	OS="mac"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	OS="linux"
fi

CURR_DIR=$(pwd)
PROJECTS_DIR=~/Projects/src/github.com/Shadowbeetle/dotfiles
cd ~
ln -sf $PROJECTS_DIR/dot-gitignore-global.symlink .gitignore-global
ln -sf $PROJECTS_DIR/$OS/dot-gitconfig.symlink .gitconfig
cd $CURR_DIR
