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

# Autostart section
exec awesome
