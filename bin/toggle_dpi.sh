#!/bin/bash
CURRENT_DPI=$(xfconf-query -c xsettings -p /Xft/DPI)

case "$CURRENT_DPI" in
    "100")
        echo Setting 196 DPI
        xfconf-query -c xsettings -p /Xft/DPI -s 196
        xfconf-query -c xfce4-panel -p /panels/panel-1/size -s 64

        ;;
    "196")
        echo Setting 100 DPI
        xfconf-query -c xsettings -p /Xft/DPI -s 100
        xfconf-query -c xfce4-panel -p /panels/panel-1/size -s 32
        ;;
    *)
        echo Setting 196 DPI
        xfconf-query -c xsettings -p /Xft/DPI -s 196
        xfconf-query -c xfce4-panel -p /panels/panel-1/size -s 64
        ;;
esac


