#!/bin/bash

#veriable set
MAIL_LIST="mail1@domain.com, mail2@domain.com , mail3@domain.com"
POST_LIST="/var/spool/cron/posts"

#setting for query
set -f
IFS=$'\n'
DBQUERY=($(mysql --batch --user=root --password=******** wordpress -se "select w.display_name as OPUBLIKOWAŁ, p.post_title as NAZWA_POSTU, p.guid as LINK_DO_POSTU from wp_posts as p left join wp_users as w on p.post_author=w.ID WHERE p.post_type='post' and p.post_title not like '%szkic%' AND p.post_date BETWEEN DATE_SUB(NOW(), INTERVAL 30 MINUTE) AND NOW();"))


#first clear elier posts
echo "" > $POST_LIST

#loop for results if any
if [ -z "${DBQUERY[0]}" ]
        then
                EMPTY="TRUE"
        else
                IFS=$'\t'
                COUNT=0
                for i in ${DBQUERY[@]}
                do
                        read -r col1 col2 col3  <<< "${DBQUERY[$COUNT]}"
                        if [ -z $col1 ]
                        then
                                EMPTY="TRUE"
                        else
                                printf "POST OPUBLIKOWANY\t\t$col1 \nNAZWA POSTU      \t\t$col2 \nLINK DO POSTU    \t\t$col3\n***************************************************\n\n" >> $POST_LIST
                        fi
                        COUNT=$((COUNT+1))
                done

                #send a post file
                cat $POST_LIST | mutt -s "Nowe posty na portalu Wordpress" -- $MAIL_LIST
fi
