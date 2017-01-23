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
