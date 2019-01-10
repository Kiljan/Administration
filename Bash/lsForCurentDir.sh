#!/bin/bash                                                          

for var in *
do
    if [[ -f $var && -x $var ]] ; then
        echo "${var} jest plikiem reguralnym i wykonywalnym"
    elif [ -f $var ] ; then
       echo "${var} jest plikiem reguralnym"
    elif [ -x $var ] ; then
        echo "${var} plik można uruchmioć"
    else
        echo "lolo ble"
    fi
done
