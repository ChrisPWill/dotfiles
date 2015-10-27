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

# Autostart section
exec awesome

rssdler -c ~/.config/rssdler/config.txt -d

synclient TapButton1=1
synclient TapButton2=2
synclient TapButton3=3
