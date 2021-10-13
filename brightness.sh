#!/bin/bash

$DIALOG=${DIALOG=dialog}
fichtmp=`tmpfile 2>/dev/null` || fichtmp=/tmp/test$$

maxbr=$(cat /sys/class/backlight/intel_backlight/max_brightness)

$DIALOG --clear --title "Brightness"	\
	--menu "Hello $USER choose Brightness" 20 51 10 \
	"10" "low" \
	"20" "   " \
	"30" "   " \
	"40" "   " \
	"50" "average" \
	"60" "   " \
	"70" "   " \
	"80" "   " \
	"90" "   " \
	"100" "high" 2> $fichtmp
valret=$?

vartmp=$(($maxbr / 100 * $(cat $fichtmp)))

case $valret in
	0) clear && sudo echo $vartmp > /sys/class/backlight/intel_backlight/brightness ;;
	1|255) clear && echo "Aborted";;
esac



