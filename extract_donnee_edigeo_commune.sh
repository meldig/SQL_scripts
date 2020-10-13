#!/bin/bash
# Script qui sert à exporter les données EDIGEO par commune.
# Se lance à partir de la fenetre shell à l'endroit ou se situent le dossier zip des données EDIGEO a copier

# 1. Indiquer l'arborescence de sortie des données (chemin ci dessous en exemple).
chemin=P:/DGI/MEL_2020

# 2. Indiquer le chemin d'acces du fichier dans lequel se trouve les codes communes (chemin ci dessous en exemple)
fichier_code_commune=V:/PROJET/08-CYGWIN_FANTOIR/02-TEST/commune.txt

# 3. Creation d'un dossier COMMUNES_EDIGEO pour ranger à l'intérieur les données EDIGEO par code INSEE
mkdir $chemin/COMMUNES_EDIGEO

# 4. Initialisation de la boucle: elle s'active pour chaque code commune indiqué dans le fichier commune.txt situé dans le même repertoire
for commune in $(cat $fichier_code_commune)

	do
		#extraction des données edigeo de la commune dans le dossier COMMUNES_EDIGEO
		unzip P:/DGI/MEL_2020/dep59.zip $commune/* -d $chemin/COMMUNES_EDIGEO/
	done
echo les fichiers sont copies