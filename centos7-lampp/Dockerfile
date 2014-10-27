FROM tukiyo3/centos7-ansible

RUN \
  exec >& /root/build-lampp.log ;\
  set -eux ;\
  echo ;\
  cd /tmp ;\
  git clone -b docker-lampp https://github.com/tukiyo/setup_centos7.git ;\
  cd /tmp/setup_centos7/first; ./run.sh ;\
  cd /tmp/setup_centos7/second; ./run.sh ;\
  cd /tmp/setup_centos7/lampp; ./run.sh ;\
  echo ;\
  cd /etc/systemd/system/multi-user.target.wants/ ;\
  test ! -e httpd.service && ln -s /usr/lib/systemd/system/httpd.service . ;\
  test ! -e mariadb.service && ln -s /usr/lib/systemd/system/mariadb.service . ;\
  test ! -e postfix.service && ln -s /usr/lib/systemd/system/postfix.service . ;\
  test ! -e dovecot.service && ln -s /usr/lib/systemd/system/dovecot.service . ;\
  test ! -e zabbix-agent.service && ln -s /usr/lib/systemd/system/zabbix-agent.service . ;\
  rm -rf /tmp/setup_centos7 ;\
  yum clean all
