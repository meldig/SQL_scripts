# !/bin/bash
# Ces lignes de commande permettent d'extraire les données DXF des fichiers PCI_VECTEUR. Elles extraient les fichiers contenus dans chaque fichier compressé contenus dans le repertoire de chaque commune.
# dans un nouveau repertoire commune

# indiquez la liste contenant les codes communes a extraire
liste=C:/Users/rjault/Documents/07_PCI_VECTEUR/liste.txt

# initialisation de la boucle: elle s'active pour chaque code commune indiqué dans la liste indiqué ligne 6.
for commune in $(cat $liste)

	# Création d'un repertoire nommé par le code commune
	do
		mkdir "C:/Users/rjault/Documents/07_PCI_VECTEUR/DXF/"$commune

		# liste les éléments du repertoire de la commune qui ont pour extention .tar.bz2 
		for f in "C:/Users/rjault/Documents/07_PCI_VECTEUR/"$commune/*.tar.bz2;

				#extraction des donnée contenant dans les fichier .tar.bz2 listés ligne 16 dans le repertoire créé à la ligne 16.
				do 
					tar --force-local -jxvf "$f" -C "C:/Users/rjault/Documents/07_PCI_VECTEUR/DXF/"$commune;
				done
	done