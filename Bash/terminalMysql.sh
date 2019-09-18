#!/bin/bash

MAIL_LIST="one@domain.com, two@domain.com"

#Create an array from wordpress tables; ps. first change global separator
IFS=$'\n'
DBQUERY=$(mysql --user=root --password=******** wordpress -se "select w.display_name as OPUBLIKOWAŁ, w.user_email as MAIL, p.post_title as NAZWA_POSTU, p.guid as LINK_DO_POSTU, DATE(p.post_date) as DATA_POSTU, time_format(p.post_date, '%T') as GODZINA_POSTU from wp_posts as p left join wp_users as w on p.post_author=w.ID WHERE p.post_type='post' and p.post_title not like '%szkic%' AND p.post_date BETWEEN DATE_SUB(NOW(), INTERVAL 10 MINUTE) AND NOW()\G;")

IFS=$'\t'
if [ -z $DBQUERY ]
then
        #Dummy variable
        EMPTY="TRUE"
else
        echo $DBQUERY | mutt -s "Nowe Posty" -- $MAIL_LIST
fi
