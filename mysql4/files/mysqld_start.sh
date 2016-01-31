#!/bin/sh

if [ ! -d "/var/lib/mysql/test/" ];then
    /opt/mysql/bin/mysql_install_db --user=mysql
fi
/opt/mysql/bin/mysqld_safe
