# Administration
## Things useful in everyday tasks
### _<sub>Three from many examples showd below_

* [BASIC_DOCKER_COMMANDS](https://github.com/Kiljan/Administration#BASIC_DOCKER_COMMANDS "BASIC_DOCKER_COMMANDS")

* [BASIC_BASH_CONSTRUCTIONS](https://github.com/Kiljan/Administration#BASIC_BASH_CONSTRUCTIONS "BASIC_BASH_CONSTRUCTIONS")

* [CLEAN_PRINTER_BUFFER](https://github.com/Kiljan/Administration#CLEAN_PRINTER_BUFFER "CLEAN_PRINTER_BUFFER")

#### BASIC_DOCKER_COMMANDS

Everything is managed by "docker" program (example below).

Build container from .tar file:
1. Load tar file as a image. After that I can check if image is imported correctly by ```docker image ls```
```bash
docker load --input image.tar
```
1. Then I can run docker process with proper parameters. Many useful information can be found by command ```man docker run```  
```bash
docker run -d -p 1337:3009 --name proc_name image_name:latest
```
1. For check the container i can use list of docker processes by ```docker ps -a```

#### BASIC_BASH_CONSTRUCTIONS

* Table declaration _(something like ArrayList in Java)_
== ```table=()```
* We can use __table=("$@")__ for every step in parameter == ```table=(1 2 3)```
*   Taking value of index 0 from table == ```${tableName[0]}```
* Write value of index 0 to the table == ```$tableName[0]=""```
* Thanks to double quotes we can do mathematical operation (like % and >=, <=, >, <) == ```$(( 1 + 2 ))```
* For loop in bash == ```for (( i=1; $i <= 100; i++)); do echo $i; done```
* Foreach loop in bash == ```for i in `cat filenames.txt`; do echo $i; done```
* Bash while loop == ```while [[ 15 >= 16 ]]; do echo "Lolo"; done```
* If statement in bash
    ```bash
    if [[ 10 == 10 || 10 == 11]]; then echo "True"; elif [[ 10 >= 14 && 10 == 25 ]]; tehn echo "False"; else echo "NULL"; fi
    ```
* Length of some string == ```${#someString}```
* Sub string 0 to 7 == ```${someString:0:7}```
* All lower case sings == ```${someString,,}```
* All upper case sings == ```${someString^^}```
* Case in Bash
    ```bash   
    case exampleString in
       cat1 )
          echo "Hello Cat" ;;
       dog1 )
          echo "Hello Dog" ;;
    esac
    ```
* Replacing characters in string _(Similar to vim construction)_
    ```bash
    ${string/what i need to change in my string/ I change to that }
    ```

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
