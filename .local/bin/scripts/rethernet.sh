#!/bin/sh

rethernet(){
    sudo modprobe -r r8168 && sudo modprobe r8168
    notify-send "Restarting Ethernet";
}

rethernet
