#!/usr/bin/bash

source "networkCheckFunction.sh"

#przypisanie wartości wejściowych
ip1=$1
ip2=$2
maska=$3

wynik=$(adresyZgodne $ip1 $ip2 $maska)

if [[ $wynik == 0  ]]
then
	echo "Komputery w tej samej sieci"
else
	echo "Komputery w różnych sieciach"
fi







