#!/bin/sh
xrandr \
    --output eDP1 \
    --primary \
    --dpi 165 \
    --mode 1920x1080 \
    --pos 0x2760 \
    --rotate normal \
    \
    --output DP1 \
    --dpi 185 \
    --mode 3840x2160 \
    --pos 1920x0 \
    --rotate left \
    \
    --output HDMI1 \
    --off \
    \
    --output HDMI2 \
    --off \
    \
    --output VIRTUAL1 \
    --off;
