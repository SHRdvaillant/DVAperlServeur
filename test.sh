#!/bin/sh
# Test du serveur

# echo "Lancement Serveur"
# perl serveur.pl >/dev/null 2>&1 &
# sleep 2

perl client 'localhost' '7777' 'stop'
if [ $? -ne 0 ] ; then
	echo "KO"
	exit 1
fi
echo "OK"
exit 0
