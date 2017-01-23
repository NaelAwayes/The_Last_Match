#!/bin/bash  

my_nb_ligne ()
{
    line=$1
    if [[ "$line" =~ (^[2-9]$)|(^(10)$) ]]
    then
        return 0
    else
        return 1
    fi
}

end ()
{
    if [ $turn -eq 1 ]
    then
	echo -e "La victoire vous appartien!\nVous avez vaincue l'ia en $nb_turn tour(s)!"
    else
	echo -e "Vous avez ete ecrase par l'ia en $nb_turn tour(s)..."
    fi
}

end_pvp ()
{
    if [ $turn -eq 1 ]
    then
	echo -e "Le joueur 1 a gagne!!"
    else
	echo -e "Le joueur 2 a gagne!!"
    fi
    echo "Il aura mis $nb_turn tour(s)!"
}

end_ia ()
{
    if [ $turn -eq 1 ]
    then
        echo -e "L'IA la plus pousse gagne!"
    else
        echo -e "Ce n'est pas l'IA la plus pousser qui gagne... RealSteel"
    fi
    echo "Elle aura mis $nb_turn tour(s)!"
}

begin ()
{
    line=$1
    my_nb_ligne $line
    test_num=$?
    while [ $test_num -ne 0 ]
    do
	read -p "Entrer un nombre entre 2 et 10 : " line
        my_nb_ligne $line
        test_num=$?
    done
    return $line
}

