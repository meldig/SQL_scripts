#!/bin/bash
# Script qui sert à rechercher les codes communes dans les fichiers majic pour copier les données par communes dans un dossier correspondant
# Se lance à partir de la fenetre de commande shell à l'endroit ou se situent les fichiers MAJIC a copier

# 1. Indiquer l'arborescence de sortie (chemin ci dessous en exemple).
chemin=C:/Users/rjault/Documents/08-CYGWIN_FANTOIR/02-TEST

# 2. Indiquer le chemin d'acces du fichier texte dans lequel se trouve les code communes (chemin ci dessous en exemple).
fichier_code_commune=C:/Users/rjault/Documents/08-CYGWIN_FANTOIR/02-TEST/commune_test.txt

# 3. Creation d'un dossier COMMUNES pour ranger à l'intérieur les données MAJIC par code INSEE
mkdir $chemin/COMMUNES

# 4. Initialisation de la boucle: elle s'active pour chaque code commune indiqué dans le fichier commune.txt situé dans le même repertoire
for commune in $(cat $fichier_code_commune)

	do
		# 4.1. Création du dossier de la commune avec pour nom le code INSEE de la commune
		mkdir $chemin/COMMUNES/$commune

		# 4.2. Création du code a rechercher dans le fichier majic code dep + 1 + code commune
		recherche="`expr substr $commune 1 2`1`expr substr $commune 3 5`"

		# 4.3 Fonction egrep pour copier les fichiers MAJIC dans les dossiers
		egrep ^$recherche 591_NORD_FANTOIR.txt > $chemin/COMMUNES/$commune/591_NORD_FANTOIR.txt
		egrep ^$recherche ART.DC21.W19591.BATI.A2019.N001188_2 > $chemin/COMMUNES/$commune/ART.DC21.W19591.BATI.A2019.N001188
		egrep ^$recherche ART.DC21.W19591.LLOC.A2019.N001188 > $chemin/COMMUNES/$commune/ART.DC21.W19591.LLOC.A2019.N001188
		egrep ^$recherche ART.DC21.W19591.NBAT.A2019.N001188 > $chemin/COMMUNES/$commune/ART.DC21.W19591.NBAT.A2019.N001188
		egrep ^$recherche ART.DC21.W19591.PDLL.A2019.N001188 > $chemin/COMMUNES/$commune/ART.DC21.W19591.PDLL.A2019.N001188
		egrep ^$recherche ART.DC21.W19591.PROP.A2019.N001188 > $chemin/COMMUNES/$commune/ART.DC21.W19591.PROP.A2019.N001188
		
		# 4.4. Zip des fichiers dans le repertoire de la commune
		zip -r -j  $chemin/COMMUNES/$commune/$commune.zip $chemin/COMMUNES/$commune/
	done
echo les fichiers sont copies



