#!/bin/bash

listVar=("FILEONE.TXT" "FILETWO.TXT" "FILEN.TXT")

for i in "${listVar[@]}"; do
    echo "Start for $i"
    java -jar /home/lol/tasks/mainJar.jar /mnt/OUT/$i
done
