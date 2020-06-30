#!/bin/sh
#
# Connect monitor with mirroring
SameMonitor(){
  xrandr --output DP1 --auto --same-as eDP1
}

# Connect monitor as extended
NextMonitor(){
    xrandr --output DP1 --auto --right-of eDP1
}
# Disconnect monitor
NoMonitor(){
    xrandr --output DP1 --off
}
# Get all possible displays
allposs=$(xrandr -q | grep -w "connected")
# Get all connected screens.
screens=$(echo "$allposs"| grep " connected" | awk '{print $1}')

# Get user choice including multi-monitor and manual selection:
chosen=$(printf "%s\\nsame-monitor\\nnext-monitor\\nno-monitor" "$screens" | dmenu -i -p "Select display arangement:") &&
case "$chosen" in
    "same-monitor") SameMonitor ;;
    "next-monitor") NextMonitor ;;
    "no-monitor") NoMonitor ;;
    *) xrandr --output "$chosen" --auto --scale 1.0x1.0 $(echo "$allposs" | grep -v "$chosen" | awk '{print "--output", $1, "--off"}' | tr '\n' ' ') ;;
esac
