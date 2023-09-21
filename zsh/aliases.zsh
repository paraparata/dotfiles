alias nv="nvim"

# git
alias gsws="gsw staging"
alias gswb="gsw beta"
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

# golang
alias gorr="go run ."

# bun
alias bund="bun run dev"
alias burr="bun run"

# c
#alias crun='f() { clang -o ${$1/.c/""} $1 && ./${$1/.c/""} };f'


# nx monorepo
# function nxgn () {
#  nx g @nrwl/next:$1 
# }
