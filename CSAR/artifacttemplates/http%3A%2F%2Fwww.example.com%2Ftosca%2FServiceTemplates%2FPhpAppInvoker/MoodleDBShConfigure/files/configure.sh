#!/bin/bash
# input vars: AdminPassword AdminUser DBName DBUser DBPassword ServerIp

# Update MySQL Dump and upload it
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sqlfile=$DIR'/../../MoodleDBSQLDump/files/moodle28.sql'
AdminPasswordMD5="$(echo -n "$AdminPassword" | md5sum | cut -f1 -d' ')"
sed -i -e 's#DBNAME#'${DBName}'#' $sqlfile
sed -i -e 's#ADMINUSERNAME#'${AdminUser}'#' $sqlfile
sed -i -e 's#ADMINUSERPASSWORD#'${AdminPasswordMD5}'#' $sqlfile

# -h $ServerIp
mysql -u$DBUser -p$DBPassword -h 127.0.0.1 < $sqlfile
