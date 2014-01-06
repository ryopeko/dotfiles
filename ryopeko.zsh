autoload -U compinit
compinit

bindkey -e

export LANG=ja_JP.UTF-8
export PATH=$PATH:/opt/local/bin:/opt/bin
export PATH=/usr/local/git/bin:$PATH
export PATH=/usr/local/bin:$PATH

export LS_COLORS='di=35;34:ln=32:ex=35'

alias ls='ls -G'
alias l='ls -l'
alias la='ls -la'
alias vi='vim'
alias gvim='/Applications/MacVim.app/Contents/MacOS/mvim'
alias g='git'
alias r='rails'
alias be='bundle exec'
alias tm='tmux'
alias gg='git grep -n'

export EDITOR='vim'

autoload -U colors; colors

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


export PATH="$HOME/.rbenv/bin:${HOME}/.rbenv/shims:${PATH}"
eval "$(rbenv init -)"

source $HOME/perl5/perlbrew/etc/bashrc

function chpwd() {
  ls
}
