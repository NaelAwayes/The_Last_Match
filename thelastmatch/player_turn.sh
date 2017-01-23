#!/bin/bash

check_input ()
{
    echo "Votre tour :"
    read -p "Ligne : " line
    if [[ $line =~ ^[0-9]+$ ]] && [ $line -ge 1 ] && [ $line -le ${tab[0]} ];
    then
	read -p "Nombre d'allumettes : " matches
	if [[ $matches =~ ^[0-9]+$ ]] && [ $matches -ge 1 ] && [ $matches -le ${tab[$line]} ];
	then
	    tab[$line]=$((${tab[$line]}-$matches))
	    echo "Vous retirez $matches allumette(s) sur la ligne $line"
	    return 1
	else
	    return 0
	fi
    else
	return 0
    fi
}

player_turn ()
{
    i=0
    while [ 42 -eq 42 ]
    do
	check_input
	pturn_end=$?
	if [ $pturn_end -eq 1 ]
	then
	    return 1
	fi
    done
}


