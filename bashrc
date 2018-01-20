HISTSIZE=500000

# ---------------------- GLOBAL -------------------------
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# ---------------------- PROMPT -------------------------
C_NONE='\[\033[0m\]'
C_RED='\[\033[0;31m\]'
C_GREEN='\[\033[0;32m\]'
C_BLUE='\[\033[0;34m\]'
C_YELLOW='\[\033[1;33m\]'
C_WHITE='\[\033[1;37m\]'
C_BOLD='\[\e[1;91m\]'

function _update_ps1() {
    PS1="$(powerline-shell $?)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

PS1="$C_GREEN\u$C_RED|$C_WHITE\w$C_BLUE >$C_NONE "

# ---------------------- PLATFORM SPECIFIC SETTINGS -------------------------
case $(uname) in
    Linux)
        alias ll='ls -lh --color=auto'
        alias lla='ls -lha --color=auto'
        alias bcopy='xclip -i -sel clip'
        alias bpaste='xclip -o -sel clip'
        ;;
    Darwin)
        export CLICOLOR=1
        alias lsa='ls -lah'
        alias ll='ls -lGh'
        ;;
esac

# ---------------------- ENVIRONMENT -------------------------
export EDITOR=vim
export GOROOT=$HOME/go
export GOBIN=$GOROOT/bin
export GOPATH=$HOME/development/gocode
export PATH=$PATH:$GOBIN

# ---------------------- ALIAS -------------------------
alias gs='git status -u'
alias gc='git commit'
alias gca='git commit -a'
alias gcs='git commit -as'
alias gb='git branch -v -v'
alias gbd='git branch -d'
alias gaa='git add -A'
alias gco='git checkout'
alias glg='git log --graph --stat --oneline --decorate'
alias gl='git log --graph --oneline --decorate'
alias gm='git merge --no-ff'
alias gcl='git clone'
alias gpo='git push origin'
alias gp='git push'
alias gd='git diff'
alias cl='clear'
alias tree='tree -F'
alias tre='tree -F -L 1'
alias curl='curl -s'
alias tarl='tar -tvf'

# ---------------------- FUNCTIONS -------------------------
function reset_master() {
    git checkout master
    git fetch origin && git reset --hard origin/master
}

function remove_images_none() {
    docker rmi $(docker images | grep "<none>" | awk '{print $3}')
}

function clean_merged_branches() {
    git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
}

function hash_dir() {
    find . -type f -o -type d  | cpio -o  | sha1sum
}

function linecount() {
    find . -name "*.$1" | xargs wc -l
}

function tunnel() {
    ssh $1 -L "$2:$3" -N
}

function pad() {
    case "$1" in
        "on")
            xinput set-prop 13 139 1 ;;
        "off")
            xinput set-prop 13 139 0 ;;
    esac
}

# show all installed packages on a debian based system
function installed_packages() {
    dpkg --get-selections | grep -v deinstall
}

function git_undo() {
    git reset --soft HEAD^
}

function getmysshkey() {
    cat ~/.ssh/id_rsa.pub | bcopy
}
