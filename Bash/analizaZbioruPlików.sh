#!/usr/bin/bash

#należy podać trzy parametry
#1. Katalog w jakim są przechowywane pliki jakie chcemy sprawdzić
#2. Rozszerzenie pliku (w wypadku braku bran są wszystkie pod uwagę)
#3. Liczba dni o ile mamy cofnąć się w stecz (z automatu jest wzięty jeden dzień)

katalog=$1
if [[ $2  ]]
then
	rozszerzenie="."$2
else
	rozszerzenie=""
fi
if [[ $3  ]]
then
	przesuniecieDni=$3
else
	przesuniecieDni=1
fi
sciezka=$katalog"/*"$rozszerzenie
przesuniecieSekund=$(($przesuniecieDni * 86400))
for plik in $sciezka
do
	czas=$(stat -c "%X" $plik)
	czasUsr=$(stat -c "%x" $plik)
		#stat to ciekawa funkcja jaką można doinstalować z pakietu
	minCzas=$(date +"%s")
		#date to również jedna z funkcji tyle, że systemowa
	minCzas=$(($minCzas - $przesuniecieSekund))

	if (($czas >= $minCzas))
	then
		echo $plik" czas: "$czasUsr
	fi
done




