#!/bin/sh

xrandr --output VIRTUAL1 --off \
       --output eDP1 --off \
       --output DP1 --off \
       --output DP2 --off \
       --output HDMI2 --off \
       --output HDMI1 --mode 1920x1200 --pos 1920x0 --rotate left \
       --output VGA1 --mode 1920x1200 --pos 0x288 --rotate normal
