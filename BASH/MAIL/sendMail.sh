# I can send by sendmail
echo "Some message" | mailx -s "Header" "mail0@domain.com"

# or using mutt
# i can configure client to send stuff
# file to write settings is .muttrc
# Content of .muttrc
# set imap_user = "mail@adress.com"
# set imap_pass = "password"
# set smpt_url = "smtp:url:port"
# set smtp_pass = "password"
# set from = "mail@adress.com"
# set realname "name to show"
# set folder = "imaps:url:port"
# set ssl_starttls = yes
# set ssl_force_tls = yes

MAIL_LIST="mail1@domain.com, mail2@domain.com , mail3@domain.com"
FILE_TO_SEND="/var/spool/cron/posts"

mutt -s "test jak nic " mail4@domain.com < /dev/null

echo "Some message" | mutt -s "Header " mail3@domain.com

cat $FILE_TO_SEND | mutt -s "New posts on the Wordpress portal" -- $MAIL_LIST
