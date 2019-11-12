#!/bin/bash

# temperatura rdzenia 0 powyżej której wszczynamy alarm
ALARM_TEMP=57

# plik alarmowy
FILE_ALARM=/home/sensors/temp.txt

# odczytywanie wartości temp
CORE_TEMP=`sensors | grep "Core 0:" | head -1 | awk '{ print $3 }'`
NUMB_TEMP=${CORE_TEMP:1:2}

if [ $NUMB_TEMP -ge $ALARM_TEMP ]
then
    echo "Uwaga! Temperatura przekracza stan ostrzegawczy. Temperatura procesora: $CORE_TEMP, stan alarmowy: $ALARM_TEMP°C" > $FILE_ALARM
fi

exit 0
