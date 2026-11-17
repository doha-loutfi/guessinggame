#!/bin/bash
# guessinggame.sh
# Jeu : deviner combien de fichiers se trouvent dans le répertoire actuel.

# Fonction qui compte les fichiers (hors dossiers et fichiers cachés)
count_files() {
    ls -p | grep -v / | wc -l
}

nb_files=$(count_files)
guess=-1

echo "Bienvenue dans le jeu de devinettes !"
echo "Combien de fichiers y a-t-il dans le répertoire actuel ?"

# Boucle : on continue tant que la réponse n'est pas correcte
while [[ $guess -ne $nb_files ]]
do
    read -p "Entrez votre estimation : " response

    # Vérifier que la saisie est bien un nombre entier
    if ! [[ $response =~ ^[0-9]+$ ]]
    then
        echo "Veuillez entrer un nombre entier valide."
        continue
    fi

    guess=$response

    if [[ $guess -lt $nb_files ]]
    then
        echo "Trop bas ! Essayez encore."
    elif [[ $guess -gt $nb_files ]]
    then
        echo "Trop haut ! Essayez encore."
    else
        echo "Félicitations ! Vous avez deviné le bon nombre : $nb_files fichiers."
    fi
done
