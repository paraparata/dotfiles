alias nv="nvim"

# git
alias gsws="gsw staging"
alias gfsps="gf && gsws && git pull"
alias gfspd="gf && gswd && git pull"
alias gssw="git stash --include-untracked && git switch"
alias gbDxp='f() { git branch | grep $1 };f'
alias gbDx='f() { git branch | grep $1 | xargs git branch -D };f'

# rust
alias carn="cargo new"
alias carr="cargo run"
alias carb="cargo build"

# nx monorepo
# function nxgn () {
#  nx g @nrwl/next:$1 
# }
