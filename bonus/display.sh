#!/bin/bash 

declare -i len

calc_marge ()
{
    i=0

    while [ $i -lt $((${tab[${tab[0]}]} + 4)) ]
    do
	#echo -n "*"
        i=$(($i + 1))
        len=$(($i + 1))
    done
    len=$(($len - 1))
}

display_tab () {
    last_line=${tab[0]}
    i=0
    half_space=0
    j=1

    while [ $i -lt $len ]
    do
        echo -n "*"
        i=$(($i + 1))
    done
    i=0
    echo ""
    while [ $j -le $last_line ]
    do
        spaces=$(($last_line - $j))
        echo -n "*"
        while [ $i -le $spaces ]
        do
            echo -n " "
            i=$(($i + 1))
        done
        while [ $i -le $((${tab[$j]} + $spaces)) ]
        do
            echo -n "|"
            i=$(($i + 1))
        done
        while [ $i -lt $(($len - 2)) ]
        do
            echo -n " "
            i=$(($i + 1))
        done
        echo "*"
        i=0
        j=$(($j + 1))
    done
    while [ $i -lt $len ]
    do
        echo -n "*"
        i=$(($i + 1))
    done
    echo -e "\n"
}