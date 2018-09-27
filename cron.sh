#!/bin/bash

###################################################################
# Ensure only one run at a time
SCRIPT_NAME="$(basename $0)"
PIDFILE="/var/run/${SCRIPT_NAME}.pid"

if [[ -f $PIDFILE ]]; then
  if  pgrep -F "$PIDFILE" -f "$SCRIPT_NAME" &>/dev/null ; then
    echo "Script already running. Exiting..."
    exit 2
  fi
fi
echo $$ > $PIDFILE
###################################################################

# Rest of the script
echo "Sleep 10"
sleep 10
echo "exiting"

