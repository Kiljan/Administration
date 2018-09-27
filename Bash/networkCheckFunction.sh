#!/usr/bin/bash

readonly iloscBitow=32
readonly bajt=8

function czytelnyAdresDoLiczby {

local czytelny=$1
local czytelnyTablica=(${czytelny//./ })
local wynik=${czytelnyTablica[0]}

for (( i=1; $i<${#czytelnyTablica[@]}; i++ ))
do
	wynik=$(( wynik << $bajt ))
	wynik=$(( wynik | ${czytelnyTablica[$i]} ))
done
echo $wynik
}

function pobierzDlugoscMaski {

local maska=$1
local maskaTablica=(${maska//./ })
local wynik=0

for octet in "${maskaTablica[@]}"
do
	if [[ "$octet" == "255"  ]]
	then
		wynik=$((wynik + $bajt))
	fi
done
echo $wynik
}



function adresyZgodne {

local adresKomputera=$(czytelnyAdresDoLiczby $1)
local adresRutera=$(czytelnyAdresDoLiczby $2)
local dlugoscMaski=$(pobierzDlugoscMaski $3)
local przesuniecie=$(($iloscBitow - $dlugoscMaski))
adresKomputera=$((adresKomputera >> $przesuniecie))
adresRutera=$((adresRutera >> $przesuniecie))

if [[ $adresKomputera == $adresRutera  ]]
	then
		echo 0;	
	else
		echo 1;
fi
}

