#!/bin/bash
if [[ $(setxkbmap -query | grep layout | grep pt) ]]; then 
    setxkbmap gb 
else 
    setxkbmap pt 
fi
