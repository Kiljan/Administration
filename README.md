# Administration 
## Things useful in everyday tasks
### _<sub>Three from many examples showd below_

* [CLEAN_PRINTER_BUFFER](https://github.com/Kiljan/Administration#CLEAN_PRINTER_BUFFER "CLEAN_PRINTER_BUFFER")

* [BRODCAST_CALC](https://github.com/Kiljan/Administration#BRODCAST_CALC "BRODCAST_CALC")

* [BASIC_BASH_CONSTRUCTIONS](https://github.com/Kiljan/Administration#BASIC_BASH_CONSTRUCTIONS "BASIC_BASH_CONSTRUCTIONS")

#### CLEAN_PRINTER_BUFFER

```bat

@echo off
echo CLEAN_PRINTER_BUFFER
net stop spooler
echo Remove documents for printout
del /q /f /s "%systemroot%\system32\spool\PRINTERS\*.*"
net start spooler
echo Success
pause
```

#### BRODCAST_CALC

```bash
#!/bin/bash

# Calculates network and broadcast based on supplied ip address and netmask

# forked from cskeeters/broadcast_calc.sh

# Usage: broadcast_calc.sh 192.168.0.1 255.255.255.0
# Usage: broadcast_calc.sh 192.168.0.1/24


tonum() {
    if [[ $1 =~ ([[:digit:]]+)\.([[:digit:]]+)\.([[:digit:]]+)\.([[:digit:]]+) ]]; then
        addr=$(( (${BASH_REMATCH[1]} << 24) + (${BASH_REMATCH[2]} << 16) + (${BASH_REMATCH[3]} << 8) + ${BASH_REMATCH[4]} ))
        eval "$2=\$addr"
    fi
}
toaddr() {
    b1=$(( ($1 & 0xFF000000) >> 24))
    b2=$(( ($1 & 0xFF0000) >> 16))
    b3=$(( ($1 & 0xFF00) >> 8))
    b4=$(( $1 & 0xFF ))
    eval "$2=\$b1.\$b2.\$b3.\$b4"
}

if [[ $1 =~ ^([0-9\.]+)/([0-9]+)$ ]]; then
    # CIDR notation
    IPADDR=${BASH_REMATCH[1]}
    NETMASKLEN=${BASH_REMATCH[2]}
    zeros=$((32-NETMASKLEN))
    NETMASKNUM=0
    for (( i=0; i<$zeros; i++ )); do
        NETMASKNUM=$(( (NETMASKNUM << 1) ^ 1 ))
    done
    NETMASKNUM=$((NETMASKNUM ^ 0xFFFFFFFF))
    toaddr $NETMASKNUM NETMASK
else
    IPADDR=${1:-192.168.1.1}
    NETMASK=${2:-255.255.255.0}
fi

tonum $IPADDR IPADDRNUM
tonum $NETMASK NETMASKNUM

#printf "IPADDRNUM: %x\n" $IPADDRNUM
#printf "NETMASKNUM: %x\n" $NETMASKNUM

# The logic to calculate network and broadcast
INVNETMASKNUM=$(( 0xFFFFFFFF ^ NETMASKNUM ))
NETWORKNUM=$(( IPADDRNUM & NETMASKNUM ))
BROADCASTNUM=$(( INVNETMASKNUM | NETWORKNUM ))

IPADDRBIN=$(   python -c "print(bin(${IPADDRNUM}   )[2:].zfill(32))")
NETMASKBIN=$(  python -c "print(bin(${NETMASKNUM}  )[2:].zfill(32))")
NETWORKBIN=$(  python -c "print(bin(${NETWORKNUM}  )[2:].zfill(32))")
BROADCASTBIN=$(python -c "print(bin(${BROADCASTNUM})[2:].zfill(32))")

toaddr $NETWORKNUM NETWORK
toaddr $BROADCASTNUM BROADCAST

printf "%-25s %s\n" "IPADDR=$IPADDR"       $IPADDRBIN
printf "%-25s %s\n" "NETMASK=$NETMASK"     $NETMASKBIN
printf "%-25s %s\n" "NETWORK=$NETWORK"     $NETWORKBIN
printf "%-25s %s\n" "BROADCAST=$BROADCAST" $BROADCASTBIN
```
#### BASIC_BASH_CONSTRUCTIONS

* Table declaration _(something like ArrayList in Java)_
    * > table=()
***
* Table declaration _(something like ArrayList in Java)_<br>We can also use __table=("$@")__ for every step in parameter 
    * > table=(1 2 3) 
***
*   Taking value of index 0 from table
    * > ${tableName[0]}
***
* Write value of index 0 to the table
    * > $tableName[0]=""

***
* Thanks to double quotes we can do mathematical operation. <br>_Also modulo $(( 5 % 11 )) and >=, <=, >, <_
    * > $(( 1 + 2 ))
***
* For loop in bash
    * > for (( i=1; $i <= 100; i++)); do echo $i; done
* Foreach loop in bash
    * > for i in `cat filenames.txt`; do echo $i; done
***
* Bash while loop
    * > while [[ 15 >= 16 ]]; do echo "Lolo"; done
***
* If statement in bash
    * > if [[ 10 == 10 || 10 == 11]]; then echo "True"; elif [[ 10 >= 14 && 10 == 25 ]]; tehn echo "False"; else echo "NULL"; fi
***
* Length of someString string
    * > ${#someString}
***
* Sub string 0 to 7
    * > ${someString:0:7}
*** 
* All lower case sings
    * > ${someString,,}
***
* All upper case sings
    * > ${someString^^}
***
* Case in Bash
    * ```   
        case exampleString in
            cat1 )
                echo "Hello Cat" ;;
            dog1 )
                echo "Hello Dog" ;;
        esac
***
* Replacing characters in string _(Similar to vim construction)_
    * > ${string/what i need to change in my string/ I change to that }
***

