# grep coloring
alias grep="grep --color=auto"

alias ra="ranger"
alias racd='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'


function killport
    fuser -k $argv/tcp
end

# Rust
fish_add_path $HOME/.cargo/bin

# Ruby
fish_add_path $HOME/.rbenv/bin

## Docker
alias up='docker-compose up'
alias down='docker-compose down'

# Ansible
fish_add_path $HOME/.local/bin

# git
alias g="git"
