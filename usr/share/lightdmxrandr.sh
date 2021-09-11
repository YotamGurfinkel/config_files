#!/bin/bash

monitors_num=$(xrandr --listmonitors | head -n 1 | awk -F ': ' '{print $2}')

if [ $monitors_num == '2' ]
then
	xrandr --output eDP1 --off
fi
