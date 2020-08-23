#!/bin/bash

listVar=("FILEONE.TXT" "FILETWO.TXT" "FILEN.TXT")

for i in "${listVar[@]}"; do
    echo "Start for $i"
    java -jar @HOME/tasks/mainJar.jar /mnt/OUT/$i
done
