################################################################################
# this zshrc is intended for mac use
################################################################################

### SHELL
## Secrets
SECRETS="NPM_TOKEN\nGITHUB_TOKEN\nHOME_SSH_PORT\nHOME_SSH_HOST\nHOME_SSH_PORT_WIFI"
if [ ! -f ~/.secrets ]; then
 echo "~/.secrets does not exists, the following variables will not be available: "
 printf "$SECRETS\n"
else 
  source ~/.secrets
fi

## ZSH
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh
# fuzzy finder for shell history
# https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:$HOME/.nvm/versions/node/v4.4.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Tools
# Frequency based directory completion
# https://github.com/rupa/z
. $HOME/z.sh

# colorized cat
# http://pygments.org/docs/cmdline/
alias c='pygmentize -O style=emacs -f console256 -g'

# colorized ls
# https://github.com/ogham/exa
alias la="exa -abghl --git --color=automatic"

# functions
function killport() {
    lsof -i :$1 | tail -n 1 | awk '{ printf $2 }' | xargs kill -9
}

function stringeq () {
    python -c "print '$1' == '$2'"
}

# ssh
eval `ssh-agent`
alias ssh-nazgul="ssh $HOME_SSH_HOST -p $HOME_SSH_PORT"
alias ssh-nazgul-wifi="ssh $HOME_SSH_HOST -p $HOME_SSH_PORT_WIFI"

# editor
export EDITOR="atom -w"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# Markdown
alias markright="open -a /Applications/MarkRight.app"

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

## SCALA
export PATH=$PATH:/usr/local/opt/scala210/bin

## LaTeX
export PATH=$PATH:/Library/TeX/texbin

## GO
export GOROOT=$(go env GOROOT)
export PATH=$PATH:$GOROOT/bin

export GOPATH=$HOME/Projects/go
export PATH=$PATH:$GOPATH/bin

### DEVOPS
## GCE
source "$HOME/bin/google_cloud_sdk/path.zsh.inc"

## KUBERNETES
alias kuse-mini='kubectl config use-context minikube'
source <(kubectl completion zsh)

## MySQL
export PATH=$PATH:/usr/local/mysql/bin

alias mysql-start='sudo launchctl load -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist'
alias mysql-stop='sudo launchctl unload -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist'

## SPARK
export SPARK_HOME=/usr/local/spark
export PATH=$PATH:/usr/local/spark/bin

export PYTHONPATH=$SPARK_HOME/python/:$PYTHONPATH
export PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.10.1-src.zip:$PYTHONPATH

## TRACE
[ -f ~/.trace ] && source ~/.trace

### USER TOOLS
## MAC
# Finder show/hide dotfiles
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

## ZSH syntax highlighting
# MUST BE AT THE END OF THE FILE!!!
# https://github.com/zsh-users/zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
