#!/bin/bash

SOURCE_DIR=/bdirectory/data/company/files
TODAY=`date +%Y-%m-%d`
GPG_KEY=DERTF12314
BACKUP_DIR=/mnt/backup/CompanyFiles
BACKUP_FILE=$BACKUP_DIR/company_files_$TODAY.tar

rm -f $BACKUP_DIR/*
tar -cf $BACKUP_FILE $SOURCE_DIR
gpg --encrypt -r $GPG_KEY $BACKUP_FILE && rm -f $BACKUP_FILE
