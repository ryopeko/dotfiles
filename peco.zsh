function peco-src () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^S' peco-src

function peco-github-prs () {
    local pr=$(repo=`g config remote.origin.url |cut -d ":" -f 2 |sed -e s/\.git$//` | curl -s -H "Authorization: token $TOKEN" $GITHUB_API_ENDPOINT/repos/$repo/pulls |jq -r '.[] |"\(.html_url)\t\(.title)\t\(.user.login)"' | peco --query "$LBUFFER"|cut -f 1)
    if [ -n "$pr" ]; then
        BUFFER="open ${pr}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-github-prs
bindkey '^G^P' peco-github-prs

function cdgem() {
  local gem_name=$(bundle list | sed -e 's/^ *\* *//g' | peco | cut -d \  -f 1)
  if [ -n "$gem_name" ]; then
    local gem_dir=$(bundle show ${gem_name})
    echo "cd to ${gem_dir}"
    cd $gem_dir
  fi
}

function pgco() {
  local branch=$(git branch -a | peco | tr -d ' ')
  if [ -n "$branch" ]; then
    if [[ "$branch" =~ "remotes/" ]]; then
      local b=$(echo $branch | awk -F '/' '{print $3}')
      git checkout -b $b $branch
    else
      git checkout $branch
    fi
  fi
}
