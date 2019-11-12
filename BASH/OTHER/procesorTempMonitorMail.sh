#!/bin/bash

FILE=/sensors/temp.txt
LIST="test@mail.pl"

if [ -f $FILE ]; then
    mutt -s UWAGA! -i $FILE $LIST < /dev/null
    rm $FILE
fi
