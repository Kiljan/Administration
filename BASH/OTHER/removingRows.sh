#!/usr/bin/bash
# the results from the source file will be corrected and transferred to the target file

source_file=$1
destination_file=$2

present=""
previous=""

i=0
echo "" > $destination_file

while read line
do
	present=$line
	if[[ -z $present && -z $previous  ]]
	then
		continue
	fi
	echo $present >> $destination_file
	previous=$present
done < $source_file
