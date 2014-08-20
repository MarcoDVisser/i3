#!/bin/bash

VAR=$(hostname)
if [ "$VAR" == "lenovo" ]; then
xrandr --output VGA1 --mode 1024x768 --right-of LVDS1

else
xrandr --output VGA-1 --mode 1024x768 --right-of LVDS-1
fi

exit 0
