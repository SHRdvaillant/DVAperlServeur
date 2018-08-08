# DVAperlServeur
Développement d'un serveur perl écoutant 7777.
Ce projet permettra de tester le DevOps selon les instrcution de Nigel Poulton (plural Sight. thank you)

# Utilisation
>perl serveur.pl
  écoute sur le port 7777 et répond bêtement OK.
  Si le client envoie le message 'stop', le serveur s’arrête.
  Sinon il affiche le message et renvoie OK au client

>perl client.pl
  envoie des 'hello world' sur le port 7777
  on peut mettre des argument : perl client.pl serveur port msg
  Si msg = stop, le serveur s'arretera
  Sinon le serveur lira le message

>test.sh
  demarre le serveur
  fait une connexion au serveur avec le message "stop"
  Le serveur lit le message renvoie au client un message
  et s'arrête

# Remarque
Ceci est un test suite à des formations PlusralSight. pour le devOPS (CI) avec Docker.
