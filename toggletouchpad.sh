#!/bin/bash
if [[ $(synclient | grep TouchpadOff | grep 0) ]]; then 
    synclient TouchpadOff=1 
else 
    synclient TouchpadOff=0 
fi
