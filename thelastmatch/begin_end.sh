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
	echo -e "Zut ! J'ai perdu..."
    else
	echo -e "Maintenant vous pouvez voir mon réel pouvoir ! Looser"
    fi
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