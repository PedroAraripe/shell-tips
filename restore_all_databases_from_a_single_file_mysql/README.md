This script uses the pv and gzip dependencies, both optional. PV to see the download speed / progression of the databases backup and gzip to descompact the backup.

Before you run the script, make sure that you have gived the right permissions to the script, using chmod +x script_name.

When you run the script, the prompt command'll ask for the username and password of your mysql connection and the relative path of the backup file that you want to restore, then it'll generate a single file compacted of all databases in the mysql connection.
