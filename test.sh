#!/bin/sh
# Test du serveur

# echo "Lancement Serveur"
perl serveur.pl >/dev/null 2>&1 &
sleep 2

perl client.pl >./client.log 2>&1
if [ $? -ne 0 ] ; then
	echo "KO connexion allee-retour"
	exit 1
fi
echo "OK connexion allee-retour"

perl client.pl localhost 7778 'stop' >./client.log 2>&1
if [ $? -ne 0 ] ; then
	echo "KO stop"
	exit 2
fi
echo "OK stop"

exit 0
