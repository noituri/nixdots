#!/bin/bash

if hyprctl activeworkspace | grep -q "DP-1"; then
    grim -c -o DP-1 - | wl-copy
fi

if hyprctl activeworkspace | grep -q "DP-2"; then
    grim -c -o DP-2 - | wl-copy
fi
