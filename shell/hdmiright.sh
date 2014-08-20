#!/bin/bash

VAR=$(hostname)
if [ "$VAR" == "lenovo" ]; then
xrandr --output HDMI1 --mode 1920x1080 --right-of LVDS1

else
xrandr --output HDMI-1 --mode 1920x1080 --right-of LVDS-1
fi

exit 0
