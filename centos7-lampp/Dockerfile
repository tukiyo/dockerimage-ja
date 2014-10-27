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
  for s in httpd mariadb postfix dovecot zabbix-agent ;\
  do ;\
    test ! -e ${s}.service && \
    ln -s /usr/lib/systemd/system/${s}.service . ;\
  done ;\
  rm -rf /tmp/setup_centos7 ;\
  yum clean all
