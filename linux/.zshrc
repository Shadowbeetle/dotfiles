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
if [ -f $HOME/.fzf.zsh ]; then
  source $HOME/.fzf.zsh
else
  echo "install fzf into $HOME/.fzf.zs"
  echo "run 'git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install'"
  echo
fi

# Frequency based directory completion
# https://github.com/rupa/z
if [ -f $HOME/z/z.sh ]; then
  $HOME/z/z.sh
else
  echo "install z.sh into $HOME/z/z.sh"
  echo "run 'git clone git@github.com:rupa/z.git ~/z && chmod +x $HOME/z/z.sh'" 
  echo
fi

# autojump 
# https://github.com/wting/autojump/issues/488
# replace typeset -U to typeset -u in autojump.zsh
if [ -f /usr/share/autojump/autojump.zsh ]; then
  source /usr/share/autojump/autojump.zsh
else
   echo "install autojump"
   echo "run 'sudo pacman -S autojump'"
   echo
fi

# colorized cat
# http://pygments.org/docs/cmdline/
if [ $commands[pygmentize] ]; then
  alias c='pygmentize -O style=emacs -f console256 -g'
else
  echo "install pygmentize"
  echo "run 'pacman -S pygmentize'"
  echo
fi
# colorized ls
# https://github.com/ogham/exa
alias la="exa -abghl --git --color=automatic"

# case insensitive grep
alias igrep="grep -i"

# functions
function killport() {
    fuser -k $1/tcp
}

function stringeq () {
    python -c "print '$1' == '$2'"
}

# ssh
## check if ssh agent is already running by looking for keys to be added
ssh-add -l &>/dev/null
if [ "$?" = 2 ]; then
  # if not ssh-agent is running, try to load from file
  test -r ~/.ssh-agent && \
    eval "$(<~/.ssh-agent)" >/dev/null

  # if there is no ~/.ssh-agent, start the ssh agent and save it to file
  ssh-add -l &>/dev/null
  if [ "$?" = 2 ]; then
    (umask 066; ssh-agent > ~/.ssh-agent)
    eval "$(<~/.ssh-agent)" >/dev/null
    ssh-add
  fi
fi

# editor
export EDITOR="code -w"

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

### DEVOPS
## KUBERNETES
alias kuse-mini='kubectl config use-context minikube'
alias kc='kubectl'
# Check if 'kubectl' is a command in $PATH
if [ $commands[kubectl] ]; then

  # Placeholder 'kubectl' shell function:
  # Will only be executed on the first call to 'kubectl'
  kubectl() {

    # Remove this function, subsequent calls will execute 'kubectl' directly
    unfunction "$0"

    # Load auto-completion
    source <(kubectl completion zsh)

    # Execute 'kubectl' binary
    $0 "$@"
  }
fi

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
alias ju-rs="cd $GOPATH/src/github.com/RisingStack"
alias ju-shb="cd $GOPATH/src/github.com/Shadowbeetle"
alias ju-netb="cd $GOPATH/src/github.com/Netbiol"


###ZSH AGIAN
## ZSH syntax highlighting
# MUST BE AT THE END OF THE FILE!!!
# https://github.com/zsh-users/zsh-syntax-highlighting
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  echo "install zsh-syntax-highlighting"
  echo "run 'aurman -S zsh-syntax-highlighting'"
  echo
fi
