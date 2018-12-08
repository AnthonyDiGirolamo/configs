#!/bin/bash
CURRENT_DPI=$(xfconf-query -c xsettings -p /Xft/DPI)

case "$CURRENT_DPI" in
    "100")
        echo Setting 196 DPI
        xfconf-query -c xsettings -p /Xft/DPI -s 196
        ;;
    "196")
        echo Setting 100 DPI
        xfconf-query -c xsettings -p /Xft/DPI -s 100
        ;;
    *)
        echo Setting 196 DPI
        xfconf-query -c xsettings -p /Xft/DPI -s 196
        ;;
esac


