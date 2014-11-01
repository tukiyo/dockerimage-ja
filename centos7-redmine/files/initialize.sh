#!/bin/sh
set -eux

count=0
while [ ! -e /var/lib/mysql/mysql.sock -o $count -le 10 ]
do
	sleep 1
	count=`expr $count +1`
done

if [ ! -d /var/lib/mysql/redmine/ -a -e /var/lib/mysql/mysql.sock ];then
	cd /opt/redmine
	mysqladmin create redmine
	bundle exec rake generate_secret_token
	RAILS_ENV=production bundle exec rake db:migrate
fi

tail -f /var/log/httpd/*log
