autoload -U compinit
compinit

export LANG=ja_JP.UTF-8
export PATH=$PATH:/opt/local/bin:/opt/bin
export LS_COLORS='di=35;34:ln=32:ex=35'

HADOOP_HOME=/Users/user/Downloads/hadoop-0.20.2
export PATH=$HADOOP_HOME/bin:$PATH
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home

alias ls='ls -G'
alias l='ls -l'
alias la='ls -la'
alias emacs='/usr/local/bin/emacs-23.1.91'
alias e='emacs'
alias vim='/usr/local/bin/vim'
alias vi='vim'
alias g='git'
alias r='rails'
alias be='bundle exec'
alias cdu='cd ../'
alias cduu='cd ../../'
alias cduuu='cd ../../../'

autoload -U colors; colors

setopt prompt_subst

PROMPT="%n%% "
local RIGHTC=$'%{\e[1;31m%}'
local LEFTC=$'%{\e[1;33m%}'
local DEFAULTC=$'%{\e[m%}'
PROMPT=$LEFTC"$ "$DEFAULTC
export RPROMPT=$RIGHTC"[${HOST}%~]"$DEFAULTC

SPROMPT="correct: %R -> %r ? "

setopt auto_pushd

setopt pushd_ignore_dups

setopt auto_menu

setopt list_packed

HISTFILE=$HOME/.zsh-history
HISTSIZE=50000
SAVEHIST=50000
setopt extended_history

setopt share_history

bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward
