#!/bin/bash

$DIALOG=${DIALOG=dialog}
fichtmp=`tmpfile 2>/dev/null` || fichtmp=/tmp/test$$

$DIALOG --clear --title "Brightness"	\
	--menu "Hello $USER choose Brightness" 20 51 10 \
	"2400" "low" \
	"4800" "   " \
	"7200" "   " \
	"9600" "   " \
	"12000" "average" \
	"14400" "   " \
	"16800" "   " \
	"19800" "   " \
	"21600" "   " \
	"24000" "high" 2> $fichtmp
valret=$?

case $valret in
	0) clear && sudo cat $fichtmp > /sys/class/backlight/intel_backlight/brightness ;;
	1|255) clear && echo "Aborted";;
esac



