#!/usr/bin/bash

function elementyTablicy {
#local to deklaracja zmiennej lokalej
local tablicaFunkcji=("$@")
local i=0

for parametr in "${tablicaFunkcji[@]}"
do
	echo "Element $i: "$parametr 
	((i++))
done
}

tablica=("$@")
elementyTablicy "${tablica[@]}"














