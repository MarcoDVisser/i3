#!/bin/bash

VAR=$(hostname)
if [ "$VAR" == "lenovo" ]; then
xrandr --output LVDS1 --mode  1366x768 

else
xrandr --output LVDS-1 --mode 1920x1080
fi

exit 0
