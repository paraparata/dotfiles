#/bin/sh

# git clone but for work

URL="$1"
FOLDER="$2"
SSH_WORK="git@gitlab.com-work"

new_url=${URL/git@gitlab.com/$SSH_WORK}

git clone $new_url $FOLDER
