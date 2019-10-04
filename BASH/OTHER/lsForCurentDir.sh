#!/bin/bash                                                          

for var in *
do
    if [[ -f $var && -x $var ]] ; then
        echo "${var} is a regular and executable file"
    elif [ -f $var ] ; then
       echo "${var} is a regular file"
    elif [ -x $var ] ; then
        echo "${var} the file can be run"
    else
        echo "No option selected"
    fi
done
