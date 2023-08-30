cd Havenbrook/Vieux_phare/Musee_maritime/Salle_des_archives/Art_contemporain/Oeuvres_d_art

# PERMISSIONS
perm_abstrait_attendues="drwxr-x---"
perm_metal_attendues="drwxr-----"

cd Peinture
perm_abstrait_actuelles=$(ls -ld Abstrait | awk '{print $1}')
if [ "$perm_abstrait_attendues" = "$perm_abstrait_actuelles" ]; then
    cd ../Sculpture
    perm_metal_actuelles=$(ls -ld Metal | awk '{print $1}')
    if [ "$perm_metal_attendues" = "$perm_metal_actuelles" ]; then
        echo "OK ! Test 1️⃣  passed!"
    else
        echo "Oh snap! Test 1️⃣  failed!"
    fi
else
    echo "Oh snap! Test 1️⃣  failed!"
fi

# DATES
date_bois_attendues="Apr 22 2004"
date_realiste_attendues="Oct 21 2000"

cd Bois
date_bois_actuelles=$(ls -ld bois1.jpg | awk '{print $6, $7, $8}')
if [ "$date_bois_attendues" = "$date_bois_actuelles" ]; then
    cd ../../Peinture/Realiste
    date_realiste_actuelles=$(ls -ld realiste1.jpg | awk '{print $6, $7, $8}')
    if [ "$date_realiste_attendues" = "$date_realiste_actuelles" ]; then
        echo "OK ! Test 2️⃣  passed!"
    else
        echo "Oh snap! Test 2️⃣  failed!"
    fi
else
    echo "Oh snap! Test 2️⃣  failed!"
fi

# LIENS
cd ../../En_renovation
compteur_liens=0
for i in $(seq 1 4); do
    lien_attendu="../Peinture/Abstrait/abstrait${i}.jpg"
    lien_actuel=$(readlink "abstrait${i}.jpg")
    if [ "$lien_attendu" = "$lien_actuel" ]; then
        compteur_liens=$((compteur_liens+1))
    fi
done

if [ "$compteur_liens" = "4" ]; then
    echo "OK ! Test 3️⃣  passed!"
else
    echo "Oh snap! Test 3️⃣  failed!"
fi

# FICHIERS
cd ../Poubelle
var_definie=$(echo $filename_prefix)
compteur_fichiers=0

for i in $(seq 1 2 69); do
    fichier_attendu="$var_definie${i}.txt"
    if [ -e "$fichier_attendu" ]; then
        compteur_fichiers=$((compteur_fichiers+1))
    fi
done

if [ "$compteur_fichiers" = "35" ]; then
    echo "OK ! Test 4️⃣  passed!"
else
    echo "Oh snap! Test 4️⃣  failed!"
fi