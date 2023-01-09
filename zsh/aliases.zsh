alias nv="nvim"

# git
alias gsws="gsw staging"
alias gfsps="gf && gsws && git pull"
alias gfspd="gf && gswd && git pull"
alias gssw="git stash --include-untracked && git switch"
alias gbDx-list='f() { git branch | grep $1 };f'
alias gbDx='f() { git branch | grep $1 | xargs git branch -D };f'
alias gmconflict='gm --no-commit --no-ff'
alias gmconflict-diff='git diff --cached'
alias gmconflict-quit='gm --abort'

# gitweet
alias gitweet='f() { git commit --allow-empty -m $1 && git push };f'
alias gitweetf='f() { git remote add $1 $2 && git fetch $1 };f'
alias gitweetr='f() { git cherry-pick $1 --allow-empty };f'

# rust
alias carn="cargo new"
alias carr="cargo run"
alias carb="cargo build"

# nx monorepo
# function nxgn () {
#  nx g @nrwl/next:$1 
# }
