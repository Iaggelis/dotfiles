#!/bin/sh

man -k . | dmenu -l 25 | awk '{print $1}' | xargs -r man -Tpdf | zathura -
