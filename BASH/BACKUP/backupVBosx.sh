VIRT_NAME=MyLinuxWork
VIRT_DIRE=/home/master/vms/MyLinuxWork
VIRT_HDD=/u00/vms/MyLinuxWork
DT_TODAY=`date +%F`
GPG_KEY=DWSF123DS
BKP_DIR=/media/bkp/BACKUPY/$DT_TODAY/MyLinuxWork
TAR_FILE=$BKP_DIR/my_linux_work_$DT_TODAY.tar
GPG_FILE=$TAR_FILE.gpg

# create backup dir                                                      
mkdir -p $BKP_DIR

# stop virtual machine                                                          
vboxmanage controlvm $VIRT_NAME poweroff

# check if vm stoped 
# The condition is evaluated before executing the commands. If the condition evaluates to false, commands are executed.
COUNT_PRCS=`pgrep -af Box | grep -c $VIRT_NAME`
until [ $COUNT_PRCS -eq 0 ]; do
    COUNT_PRCS=`pgrep -af Box | grep -c $VIRT_NAME`
    sleep 1s
done

tar -cf $TAR_FILE $VIRT_DIRE $VIRT_HDD &&
    gpg --encrypt -r $GPG_KEY --output $GPG_FILE $TAR_FILE && rm -f $TAR_FILE

# start virtual machine                                                           
DISPLAY=:0 vboxmanage --nologo startvm $VIRT_NAME

exit 0
