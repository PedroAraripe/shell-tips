#!/bin/bash

# Dependencies used: pv (progress bar) and gzip (to compact the backup file)

echo "Pass the mysql username:";
read mysqlUserName;

echo "Pass the mysql password:";
read mysqlPassword;

echo "Pass the mysql restore file relative path:";
read BACKUP_FILE_RELATIVE_PATH;

printf " - Starting databases restore ($(date +%H:%M))...\n";

function BACKUP_ALL_DB_SSH() {
  pv $BACKUP_FILE_RELATIVE_PATH | gunzip | mysql -u $mysqlUserName -p$mysqlPassword 
};

BACKUP_ALL_DB_SSH;

printf " - Finishing databases restore ($(date +%H:%M))...\n";