# my_interface_loader

Fedora:   dnf install dialog

my_boot.sh is a shell script base on dialog to choose

different desktop windows managers

to changes buttons change var = interface name
```bash
	--menu "Hello $USER which boot manager do you want?" 20 51 $(number of rows) \
	"$(interface name)" "$(comment)" \
```
	$ chmod +x ./my_boot.sh
	$ ./my_boot.sh

brightness.sh is a shell script base on dialog to change
    machine brightness

```bash
    "DIALOG --clear --title "Brightness"	\
	--menu "Hello $USER choose Brightness" 20 51 $(number of row) \
	"$(desire brightness)" "$(comment)" \
	valret=$?

	case $valret in \
	0) clear && sudo cat $fichtmp > /sys/class/backlight/$(name of graphic interface)/brightness ;; \
	1|255) clear && echo "Aborted";;"
```
execute:

 	$ chmod +x ./brightness.sh
	$ sudo brightness
