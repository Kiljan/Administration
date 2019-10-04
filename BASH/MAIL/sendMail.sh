#!/bin/bash

# I can send by sendmail
echo "Some message" | mailx -s "Header" "mail0@domain.com"

# or using mutt

MAIL_LIST="mail1@domain.com, mail2@domain.com , mail3@domain.com"
FILE_TO_SEND="/var/spool/cron/posts"

mutt -s "test jak nic " mail4@domain.com < /dev/null

echo "Some message" | mutt -s "Header " mail3@domain.com

cat $FILE_TO_SEND | mutt -s "New posts on the Wordpress portal" -- $MAIL_LIST
