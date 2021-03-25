#!/bin/bash

#Script de sauvegarde de dokuwiki

#Déclaration de la variable qui indique y=année m=le mois d=le jour H=heure M=minutes.
d=`date +%Y%m%d%H%M`

#L'option -a préserve autant que possible la structure et les attributs du fichier original lors de la copie.
cp -a /var/www/html/conf/ /var/www/html/data/ /home/daniel/BACKUPS/

cd /home/daniel/BACKUPS/

#Crée une archive compressée avec bzip2.
#bzip2 compresse mieux que gzip mais il est plus long.
tar -jcvf dokups$d.tar.bz2 conf/ data/

#Effacement récursif des deux dossier
rm -rf conf/ data/

#L’option -r indique la récursivité
#L’option -p préserve les dates de modification, d’accès, et les modes des anciens fichiers.
scp -r -p dokups*.tar.bz2 daniel@192.168.0.11:/home/daniel/BACKUPS/

