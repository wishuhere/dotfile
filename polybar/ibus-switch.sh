#!/bin/bash

ibus_print() {

		if [ "$(ibus engine)"  == "Bamboo" ]; then
			printf 'VN'
		else printf 'US'
		fi
}

ibus_toggle() {

if [[ `ibus engine | awk -F":" '{ print $2 }'` == "us" ]]; then
	ibus engine 'Bamboo' && printf 'VN'
else
	ibus engine 'xkb:us::eng' && printf 'US'
fi
}

case "$1" in 
	--toggle)
		ibus_toggle
		;;
	*)
		ibus_print
		;;
esac
