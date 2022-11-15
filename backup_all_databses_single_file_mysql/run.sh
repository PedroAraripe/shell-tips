#!/bin/bash

# Dependencies used: pv (progress bar) and gzip (to compact the backup file)

echo "Pass the mysql username:";
read mysqlUserName;

echo "Pass the mysql password:";
read mysqlPassword;

DATE=`date +"%d-%m-%Y"`;
BACKUP_FOLDER_NAME="backup_${DATE}";

mkdir BACKUPS;
cd BACKUPS;
mkdir $BACKUP_FOLDER_NAME;
cd $BACKUP_FOLDER_NAME;

FILE_NAME="all_databases_${DATE}"

printf " - Starting databases backup ($(date +%H:%M))...\n";

function BACKUP_ALL_DB_SSH() {
  mysqldump -u $mysqlUserName -p$mysqlPassword --force --opt --all-databases --single-transaction --quick --lock-tables=false | pv | gzip > $FILE_NAME.sql.gz;
};

BACKUP_ALL_DB_SSH;

printf " - Finishing databases backup ($(date +%H:%M))...\n";