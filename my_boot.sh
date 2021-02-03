#!/bin/bash

$DIALOG=${DIALOG=dialog}
fichtemp=`tmpfile 2>/dev/null` || fichtemp=/tmp/test$$

$DIALOG --clear --title "Boot Menu"	\
	--menu "Hello $USER which boot manager do you want?" 20 51 3 \
	"i3" "Safety choice" \
	"gnome-session" "Really ?" \
	"dwm" "(A.K.A suicide) at least it sucksless" 2> $fichtemp
valret=$?
case $valret in
0) clear && cat $fichtemp > ~/.xinitrc && startx ;;
1|255) echo "Aborted";;
esac



