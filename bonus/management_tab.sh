#!/bin/bash                                                                     

declare -a tab

create_stock ()
{
    var=$1
    let "i=1"
    let "nb_al=1"
    let "tab[0]=var"
    
    while [ $i -le $var ]
    do
        let "tab[i]= nb_al"
        let "nb_al = nb_al + 2"
        let "i = i + 1"
    done
}

remove_stick ()
{
    let "tab[$1]=tab[$1]-$2"
}

is_one ()
{
    let "e=0"
    let "i=1"
    while [ $i -le ${tab[0]} ]
    do
        if [ ${tab[$i]} -gt 0 ]
        then
            let "e = e + 1"
        fi
        let "i = i + 1"
    done
    return $e
}

is_empty ()
{
    let "i=1"
    while [ $i -le ${tab[0]} ]
    do
        if [ ${tab[$i]} -gt 0 ]
        then
 	    return 1
        fi
        let "i = i + 1"
    done
    return 0
}