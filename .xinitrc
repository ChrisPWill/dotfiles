#!/bin/sh
#
# X init
# ~/.xinitrc
# Name: cpw
#

###############################################################################
# Initial System Settings
###############################################################################

###############################################################################
# Commands & Daemons
###############################################################################

compton -b
xrdb -merge ~/.Xresources
xbindkeys

rssdler -c ~/.config/rssdler/config.txt -d


synclient TapButton1=1
synclient TapButton2=3
synclient TapButton3=2

# Autostart section
exec awesome
