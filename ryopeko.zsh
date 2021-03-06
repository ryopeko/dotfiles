autoload -U compinit chpwd_recent_dirs cdr
compinit

bindkey -e

export LANG=ja_JP.UTF-8

export GOPATH=$HOME'/dev'
export GOROOT=`go env GOROOT`

export PATH=$PATH:/opt/local/bin:/opt/bin:$GOPATH/bin
export PATH=/usr/local/git/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/heroku/bin:$PATH"

export LS_COLORS='di=35;34:ln=32:ex=35'


alias ls='ls -G'
alias l='ls -l'
alias la='ls -la'
alias vi='vim'
alias gvim='env LANG=ja_JP.UTF-8 open -a /Applications/MacVim.app "$@"'
alias g='git'
alias gg='git grep'
alias r='rails'
alias be='bundle exec'
alias gg='git grep -n'
alias tm='tmux -2'
alias perldoc="perldoc -M Pod::Text::Color::Delight"
alias vo='vim $(git ls-files |peco)'
alias pc='perl -c $@'

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


if [ -n "${TMUX}" ]; then
  # 既存のシェルの SSH_AUTH_SOCK を更新
  function update_ssh_auth_sock() {
    NEWVAL=`tmux show-environment | grep "^SSH_AUTH_SOCK" | cut -d"=" -f2`
    if [ -n "${NEWVAL}" ]; then
      SSH_AUTH_SOCK=${NEWVAL}
    fi
    echo "reset ssh auth sock"
  }

  # widget 化する
  zle -N update_ssh_auth_sock

  # ショートカットキー割り当て
  bindkey "^t" update_ssh_auth_sock
fi

source $HOME/dotfiles/peco.zsh

propen() {
    local current_branch_name=$(git symbolic-ref --short HEAD | xargs perl -MURI::Escape -e 'print uri_escape($ARGV[0]);')
    git config --get remote.origin.url | sed -e "s/^.*[:\/]\(.*\/.*\).git$/https:\/\/github.com\/\1\//" | sed -e "s/$/pull\/${current_branch_name}/" | xargs open
}

ciopen() {
  commit=$1
  result=$(hub ci-status -v $commit)
  open $(echo $result | awk '{print $2}')
}
