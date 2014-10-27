FROM centos:centos7

RUN \
  exec >& /root/build.log ;\
  set -eux ;\
  yum swap -y fakesystemd systemd ;\
  unlink /etc/localtime ;\
  ln -s /usr/share/zoneinfo/Japan /etc/localtime ;\
  localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 ;\
  yum install -y epel-release ;\
  rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm ;\
  yum install -y ansible git tig vim-enhanced screen openssh-server net-tools ack wget sudo ;\
  yum clean all

ENV LANG ja_JP.UTF-8
ENTRYPOINT ["/sbin/init"]
