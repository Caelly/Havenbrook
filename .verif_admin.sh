cd Havenbrook/Vieux_phare/Musee_maritime/Salle_des_archives/Art_contemporain/Oeuvres_d_art

cd Peinture
perm_abstrait_attendues="drwxr-x---"
perm_abstrait_actuelles=$(ls -ld Abstrait | awk '{print $1}')
if [ "$perm_abstrait_attendues" = "$perm_abstrait_actuelles" ]
then
    echo "Permissions Abstrait OK"
else
    echo "Permissions Abstrait KO"
fi

cd Realiste
date_realiste_attendues="Oct 21 2000"
date_realiste_actuelles=$(ls -ld realiste1.jpg | awk '{print $6, $7, $8}')
if [ "$date_realiste_attendues" = "$date_realiste_actuelles" ]
then
    echo "Date Realiste OK"
else
    echo "Date Realiste KO"
fi

cd ../../Sculpture
perm_metal_attendues="drwxr-----"
perm_metal_actuelles=$(ls -ld Metal | awk '{print $1}')
if [ "$perm_metal_attendues" = "$perm_metal_actuelles" ]
then
    echo "Permissions Metal OK"
else
    echo "Permissions Metal KO"
fi

cd Bois
date_bois_attendues="Apr 22 2004"
date_bois_actuelles=$(ls -ld bois1.jpg | awk '{print $6, $7, $8}')
if [ "$date_bois_attendues" = "$date_bois_actuelles" ]
then
    echo "Date Bois OK"
else
    echo "Date Bois KO"
fi

cd ../../En_renovation
for i in $(seq 1 4); do
    lien_attendu="../Peinture/Abstrait/abstrait${i}.jpg"
    lien_actuel=$(readlink "abstrait${i}.jpg")
    if [ "$lien_attendu" = "$lien_actuel" ]; then
        echo "Lien abstrait${i}.jpg OK"
    else
        echo "Lien abstrait${i}.jpg KO"
    fi
done

cd ../Poubelle
echo "filename_prefix = '$filename_prefix'"
var_definie=$(echo $filename_prefix)

for i in $(seq 1 2 69); do
    fichier_attendu="$var_definie${i}.txt"
    if [ -e "$fichier_attendu" ]; then
        echo "$fichier_attendu trouvé"
    else
        echo "$fichier_attendu non trouvé"
    fi
done