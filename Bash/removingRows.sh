#!/usr/bin/bash
#wyniki z pliku zrodlowego zostana poprawione i przekazane do pliku docelowego

plik_zrodlowy=$1
plik_docelowy=$2

obecny=""
poprzedni=""

i=0
echo "" > $plik_docelowy

while read wiersz
do
	obecny=$wiersz
	if[[ -z $obecny && -z $poprzedni  ]]
	then
		continue
	fi
	echo $obecny >> $plik_docelowy
	poprzedni=$obecny
done < $plik_zrodlowy
