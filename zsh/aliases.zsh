alias nv="nvim"

# git
alias gsws="gsw staging"
alias gswb="gsw beta"
alias gfspm="gf && gswm && git pull"
alias gfspb="gf && gswb && git pull"
alias gfsps="gf && gsws && git pull"
alias gfspd="gf && gswd && git pull"
alias gssw="git stash --include-untracked && git switch"
alias gbDx-list='f() { git branch | grep $1 };f'
alias gbDx='f() { git branch | grep $1 | xargs git branch -D };f'
alias gmconflict='gm --no-commit --no-ff'
alias gmconflict-diff='git diff --cached'
alias gmconflict-quit='gm --abort'
alias gadc='git add . && git commit -m'
alias bringz='git pull'

# gitweet
alias gitweet='f() { git commit --allow-empty -m $1 && git push };f'
alias gitweetf='f() { git remote add $1 $2 && git fetch $1 };f'
alias gitweetr='f() { git cherry-pick $1 --allow-empty };f'

# rust
alias carn="cargo new"
alias carr="cargo run"
alias carb="cargo build"

# npm
alias npmd="npm run dev"
alias npmtc="npm run type-check"
alias npmf="npm run format"
alias npml="npm run lint"
alias npmc="npm run commit"

# yarn
alias yarnd="yarn run dev"
alias yarntc="yarn run type-check"
alias yarnf="yarn run format"
alias yarnl="yarn run lint"
alias yarnc="yarn run commit"


# golang
alias gorr="go run ."

# bun
alias bund="bun run dev"
alias burr="bun run"

# python
alias servv="python3 -m http.server 8000"

# docker
# alias posgre-up="limactl start docker && docker start postgres"
# alias posgre-down="docker stop postgres && limactl stop docker"
alias postgre-up="brew services start postgresql@16"
alias postgre-down="brew services stop postgresql@16"
alias postgre-list="psql -l"

# c
alias crun='f() { clang ${1}.c -o $1  && ./$1 };f'


# nx monorepo
# function nxgn () {
#  nx g @nrwl/next:$1 
# }
