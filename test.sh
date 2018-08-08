#!/bin/sh
# Test du serveur

perl serveur.pl &

perl client 'localhost' '7777' 'stop'
if [ $? -ne 0 ] ; then
	echo "Client Erreur"
	exit 1
fi
exit 0
