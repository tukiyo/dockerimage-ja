FROM centos:centos5

RUN \
  exec >& /root/build-centos5-mine.log ;\
  set -eux ;\
  unlink /etc/localtime ;\
  ln -s /usr/share/zoneinfo/Japan /etc/localtime ;\
  localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 ;\
  ;\
  yum install -y \
    php php-cli php-common php-devel php-mbstring php-mysql php-pdo \
    httpd httpd-devel \
    gd \
    nkf wget vim-enhanced w3m python-simplejson \
    make gcc perl-Time-HiRes \
    anacron crontabs vixie-cron \
    whitch zip unzip telnet tcpdump sudo screen readline \
    postfix procmail mailx \
    logwatch \
    cvs bc at openssh-server nc \
    gpg distcache libmcrypt lm_sensors mhash mod_ssl net-snmp \
    net-snmp-libs ntp sysstat yum-utils ;\
  ;\
  chkconfig httpd on ;\
  chkconfig sshd on ;\
  yum update -y ;\
  yum clean all ;\
  ;\
  echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf ;\
  echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf ;\
  /sbin/sysctl -p ;\
  ;\
  echo "[info] done."

ENTRYPOINT ["/sbin/init"]

