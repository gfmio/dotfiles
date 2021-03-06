#!/bin/sh
xrandr \
    --output eDP1 \
    --primary \
    --dpi 165 \
    --mode 1920x1080 \
    --pos 0x0 \
    --rotate normal \
    \
    --output DP1 \
    --off \
    \
    --output HDMI1 \
    --off \
    \
    --output HDMI2 \
    --mode 1920x1080 \
    --pos 1920x0 \
    --dpi 96 \
    --rotate normal \
    \
    --output VIRTUAL1 \
    --off;
