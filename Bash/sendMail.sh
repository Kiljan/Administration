#!/bin/bash

#wysłać można sendmailem 
echo "Skrypt wykonał się pomyślnie, wszystko jest ok" | mailx -s "Test zadania" "piotr@gmail.pl"

#lub za pomocą mutt-a

mutt -s "test jak nic " piotrk@suzuki.com.pl < /dev/null
