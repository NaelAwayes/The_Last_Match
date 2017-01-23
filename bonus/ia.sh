#!/bin/bash

ia_base ()
{
    lig=0
    all=0
    while [ $lig -lt 1 ] || [ ${tab[$lig]} -eq 0 ]
    do
	lig=$((RANDOM%${tab[0]}+1))
    done
    all=$((RANDOM%${tab[$lig]}+1))
    remove_stick $lig $all
    echo -e "Tour de l'IA\nL'IA retire $all allumette(s) sur la ligne $lig"
}

ia_2 ()
{
    lig=0
    all=0
    while [ $lig -lt 1 ] || [ ${tab[$lig]} -eq 0 ]
    do
        lig=$((RANDOM%${tab[0]}+1))
    done
    all=$((RANDOM%${tab[$lig]}+1))
    if [ ${tab[$lig]} -gt 1 ]
    then
	let "all=tab[lig]-1"
    fi
    remove_stick $lig $all
    echo -e "Tour de l'IA\nL'IA retire $all allumette(s) sur la ligne $lig"
}

ia_ultime ()
{
    lig=0
    all=0
    while [ $lig -lt 1 ] || [ ${tab[$lig]} -eq 0 ]
    do
        lig=$((RANDOM%${tab[0]}+1))
    done
    all=$((RANDOM%${tab[$lig]}+1))
    if [ ${tab[$lig]} -gt 1 ]
    then
        let "all=tab[lig]-1"
    fi
    is_one
    bad_boy=$?
    if [ $bad_boy -eq 1 ]
    then
	if [ ${tab[$lig]} -eq 1 ]
	then
	    let "bad_boy = 1000"
	    echo -e "\nEuh...\nTu pense m'avoir pieger?!\nTu te trompe!!!"
	    let "all=0"
	fi
    fi
    if [ $bad_boy -eq 1000 ]
    then
	echo "L'IA passe son tour..."
    else
	remove_stick $lig $all
	echo -e "Tour de l'IA\nL'IA retire $all allumette(s) sur la ligne $lig"
    fi
}