#!/usr/bin/env bash

# Usage: ./link-git.sh
OS=

if [ "$(uname)" == "Darwin" ]; then
	OS="mac"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	OS="linux"
fi

CURR_DIR=$(pwd)
PROJECTS_DIR=/home/nazgul/Projects/src/github.com/Shadowbeetle/dotfiles
cd ~
ln -sf $PROJECTS_DIR/$OS/dot-zshrc.symlink .zshrc
cd $CURR_DIR
