#!/bin/bash

#This should be used with shortcut keys, for increasing and decreasing screen brightness

function usage() {
    echo "Usage: '$0 +' or '$0 -'"
    exit
}


if [[ $# -ne 1 ]]; then
    echo $#
    usage
fi


if [[ "$1" == "+" ]]; then
    xbacklight -inc 10
elif [[ "$1" == "-" ]]; then
    if (( $(echo "$(xbacklight -get) < 12" | bc -l) )); then
        xbacklight -set 1
    else
        xbacklight -dec 10
    fi
else
    usage
fi

