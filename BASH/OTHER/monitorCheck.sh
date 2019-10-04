#!/bin/bash

while true
do
    if xrandr | grep -q "HDMI1 connected";
    then
	xrandr --output eDP1 --off --output HDMI1 --auto
    else
	xrandr --output eDP1 --auto --output HDMI1 --off
    fi
    sleep 5
done

