FROM centos:centos7

RUN \
  exec >& /root/build-systemd.log ;\
  set -eux ;\
  yum swap -y fakesystemd systemd ;\
  unlink /etc/localtime ;\
  ln -s /usr/share/zoneinfo/Japan /etc/localtime ;\
  localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 ;\
  touch /etc/rc.d/init.d/functions ;\
  yum install -y epel-release ;\
  rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm ;\
  yum clean all

ENV LANG ja_JP.UTF-8
ENTRYPOINT ["/sbin/init"]
