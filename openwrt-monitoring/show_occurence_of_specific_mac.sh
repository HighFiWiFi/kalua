#!/bin/sh

MAC="$1"	# 112233445566 or 11:22:33:44:55:66

if [ -z "$MAC" ]; then
	echo "Usage: $0 <macaddress>"
	exit 1
else
	MAC="$( echo "$MAC" | sed 'y/ABCDEF/abcdef/' | sed 's/://g' | sed 's/-//g' )"
fi

list_networks()
{
	find /var/www/networks/ -type d -name registrator | cut -d'/' -f5 | sort
}

for NETWORK in $( list_networks ); do {
	FILE="/var/www/networks/$NETWORK/meshrdf/recent/$MAC"
	[ -e "$FILE" ] && {
		echo "found $FILE"
	}
} done
