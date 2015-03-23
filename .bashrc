#!/bin/bash
if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
fi

if [ -f $HOME/.bash_completion.d/git-flow-completion.bash ]; then
  source ~/.bash_completion.d/git-flow-completion.bash
fi

if [ -f $HOME/.local/bin/prefs.sh ]; then
  $HOME/.local/bin/prefs.sh
fi

if [ -f $HOME/.local/bin/git-prompt.sh ]; then
  source ~/.local/bin/git-prompt.sh
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

export PATH=/home/nick/.local/bin:$GOPATH/bin:$PATH
export GIT_PS1_SHOWDIRTYSTATE='true'
export GIT_PS1_SHOWUNTRACKEDFILES='true'
export PS1='\[\033[00m\]\u:\[\033[01;33m\]\w\[\033[31m\]$(__git_ps1 "(%s)")\[\033[00m\]$\[\033[00m\] '
export GOPATH=$HOME/go
export BROWSER=/usr/bin/xdg-open
export JAVA_HOME=/opt/java
export DOOMWADDIR=~/wads
export WINEARCH=win32
export WINEPREFIX=~/win32
#export MOZ_USE_OMTC=1
export MOZ_ACCELERATED=1
export MOZ_GLX_IGNORE_BLACKLIST=1
export EDITOR=vim

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

eval `keychain -q --agents ssh --eval id_rsa id_rsa_pass`
