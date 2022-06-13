#/bin/sh

# vars
ARGS="$1"
RHOST="$2"
COMMAND="$3"

# exec
TERM=xterm-256color ssh $ARGS $RHOST $COMMAND
