################################################################################
# this zshrc is intended for linux use
#
# Because we don't want to commit our secrets to VCS, create
# a file named ".secrets" in your home directory and export all the secrets
# you have from there
#
################################################################################

[ -f $HOME/.secrets ] && source $HOME/.secrets
if [ -f $HOME/.secrets ]; then
  source $HOME/.secrets
else
  echo "ERROR .secrets file not found, some programs might not work"
  echo
fi

### SHELL
## ZSH
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="spaceship"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# quicly source .zshrc 
alias sz='source ~/.zshrc'

# Tools
# fuzzy finder for shell history
# https://github.com/junegunn/fzf
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# Frequency based directory completion
# https://github.com/rupa/z
. $HOME/z/z.sh

# colorized cat
# http://pygments.org/docs/cmdline/
alias c='pygmentize -O style=emacs -f console256 -g'

# colorized ls
# https://github.com/ogham/exa
alias la="exa -abghl --git --color=automatic"

# functions
function killport() {
    fuser -k $1/tcp
}

function stringeq () {
    python -c "print '$1' == '$2'"
}

# ssh
eval `ssh-agent`

# editor
export EDITOR="subl -nw"

### DEVELOPMENT
## NODE.JS
# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use 2> /dev/null

# overwrite builtin directory movements to use nvm
function cd () {
  builtin cd "$@" && nvm use 2>/dev/null
}

function popd () {
  builtin popd "$@" && nvm use 2>/dev/null
}

function pushd () {
  builtin pushd "$@" && nvm use 2>/dev/null
}

# NPM
# token in secrets
alias npml="npm run lint -- --fix 2> /dev/null"
alias npmt="npm t 2> /dev/null"
alias npmlt="npml && npmt"

# list directory tree without node_modules
alias tree-node="tree -I node_modules"

## GO
export GOPATH=$HOME/Projects
export PATH=$GOPATH/bin:$PATH
# Jump to gopath src
alias jproj="cd $GOPATH/src"

### DEVOPS
## KUBERNETES
alias kuse-mini='kubectl config use-context minikube'
source <(kubectl completion zsh)

## Docker
alias up='docker-compose up'
alias down='docker-compose down'

## AWS
export PATH=~/.local/bin:$PATH

## VAGRANT
export VAGRANT_HOME=/run/media/ext4/VirtualBox/
export VAGRANT_DEFAULT_PROVIDER=virtualbox

## SERVER SSH ALIASES
# ssh aliases
# $HOME/.secrets

### HOME APPLICATIONS
alias viber='LD_LIBRARY_PATH=/opt/viber viber LD_PRELOAD=libcurl.so.3 /opt/viber/Viber'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

## Navigation
# Jump to dotfiles
# jump instantly to applications directory
alias ju-apps='cd /usr/share/applications'
alias ju-dot='cd ~/dotfiles'
alias co-dot='code ~/dotfiles'
alias ju-proj="cd $GOPATH/src"


###ZSH AGIAN
## ZSH syntax highlighting
# MUST BE AT THE END OF THE FILE!!!
# https://github.com/zsh-users/zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
