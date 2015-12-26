#!/bin/bash
echo "I am in install.sh"
www=/var/www;
Moodle=$www/moodle;
#loghtaccess=$Moodle/log4php/.htaccess

touch $Moodle/config.php;


echo "Creating "$DataRoot;
mkdir -p $DataRoot;
echo "Setting access rights on "$DataRoot;
chmod 0777 $DataRoot -R;

chmod 755 $www/moodle/ -R;
chmod 766 $Moodle/config.php;
#chmod 766 $Moodle/.htaccess
chmod 777 $Moodle/cache -R;

echo "<?PHP
///////////////////////////////////////////////////////////////////////////
//                                                                       //
// Moodle configuration file                                             //
//                                                                       //
// This file should be renamed \"config.php\" in the top-level directory   //
//                                                                       //
///////////////////////////////////////////////////////////////////////////
//                                                                       //
// NOTICE OF COPYRIGHT                                                   //
//                                                                       //
// Moodle - Modular Object-Oriented Dynamic Learning Environment         //
//          http://moodle.org                                            //
//                                                                       //
// Copyright (C) 1999 onwards  Martin Dougiamas  http://moodle.com       //
//                                                                       //
// This program is free software; you can redistribute it and/or modify  //
// it under the terms of the GNU General Public License as published by  //
// the Free Software Foundation; either version 3 of the License, or     //
// (at your option) any later version.                                   //
//                                                                       //
// This program is distributed in the hope that it will be useful,       //
// but WITHOUT ANY WARRANTY; without even the implied warranty of        //
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         //
// GNU General Public License for more details:                          //
//                                                                       //
//          http://www.gnu.org/copyleft/gpl.html                         //
//                                                                       //
///////////////////////////////////////////////////////////////////////////
unset(\$CFG);  // Ignore this line
global \$CFG;  // This is necessary here for PHPUnit execution
\$CFG = new stdClass();

\$CFG->dbtype    = 'mysqli';      // 'pgsql', 'mysqli', 'mssql', 'sqlsrv' or 'oci'
\$CFG->dblibrary = 'native';     // 'native' only at the moment
\$CFG->dbhost    = 'YOURDBHOST';  // eg 'localhost' or 'db.isp.com' or IP
\$CFG->dbname    = 'YOURDBNAME';     // database name, eg moodle
\$CFG->dbuser    = 'YOURDBUSER';   // your database username
\$CFG->dbpass    = 'YOURDBPASSWORD';   // your database password
\$CFG->prefix    = 'mdl_';       // prefix to use for all table names
\$CFG->dboptions = array(
    'dbpersist' => false,       // should persistent database connections be
                                //  used? set to 'false' for the most stable
                                //  setting, 'true' can improve performance
                                //  sometimes
    'dbsocket'  => false,       // should connection via UNIX socket be used?
                                //  if you set it to 'true' or custom path
                                //  here set dbhost to 'localhost',
                                //  (please note mysql is always using socket
                                //  if dbhost is 'localhost' - if you need
                                //  local port connection use '127.0.0.1')
    'dbport'    => 'DBPORT',          // the TCP port number to use when connecting
                                //  to the server. keep empty string for the
                                //  default port
);
\$CFG->wwwroot   = 'http://HOSTNAME/moodle';
\$CFG->dataroot  = 'YOURDATAROOT';
\$CFG->directorypermissions = 02777;
\$CFG->admin = 'admin';
require_once(dirname(__FILE__) . '/lib/setup.php'); // Do not edit

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!" > $Moodle/config.php;

#restrict access to the logfiles
#echo "# BEGIN SUGARCRM RESTRICTIONS RedirectMatch 403 (?i).*\.log$ RedirectMatch 403 (?i)/+not_imported_.*\.txt RedirectMatch 403 (?i)/+(soap|cache|xtemplate|data|examples|include|log4php|metadata|modules)/+.*\.(php|tpl) RedirectMatch 403 (?i)/+emailmandelivery\.php RedirectMatch 403 (?i)/+upload RedirectMatch 403 (?i)/+custom/+blowfish RedirectMatch 403 (?i)/+cache/+diagnostic RedirectMatch 403 (?i)/+files\.md5$ # END SUGARCRM RESTRICTIONS">$loghtaccess
#chmod 766 $loghtaccess

MoodleDir='/var/www/moodle';
ResponseFile=$MoodleDir/config.php;

VmApache=`ifconfig eth0 | grep 'inet addr:' | awk '{print $2}' | sed s/addr://g`;
httpdport=`cat /etc/apache2/httpd.conf | grep ^Listen | awk '{print $2}'`;

echo "Prepare the config file for Moodle"
echo "Administrator: "$AdminUser
echo "Administrator Password: "$AdminPassword

# override address of the original version of this file, as we need the address from the ServerIp Property, not the potential internal address
VmApache=$ServerIP

echo "VmApache var:"
echo $VmApache
echo "ServerIP var:"
echo $ServerIP

sed -i -e 's#HOSTNAME#'${VmApache}'#' $ResponseFile
sed -i -e 's#SITEADMINPWD#'${AdminPassword}'#' $ResponseFile
sed -i -e 's#SITEADMINUNAME#'${AdminUser}'#' $ResponseFile
sed -i -e 's#YOURWEBPORT#'${httpdport}'#' $ResponseFile
sed -i -e 's#YOURDATAROOT#'${DataRoot}'#' $ResponseFile