FROM centos:centos5

RUN \
  exec >& /root/build-centos5-mine.log ;\
  set -eux ;\
  unlink /etc/localtime ;\
  ln -s /usr/share/zoneinfo/Japan /etc/localtime ;\
  localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 ;\
  :;\
  yum install -y \
    php php-cli php-common php-devel php-mbstring php-mysql php-pdo \
    httpd httpd-devel \
    gd \
    nkf wget vim-enhanced w3m python-simplejson \
    make gcc \
    anacron crontabs vixie-cron \
    zip unzip telnet tcpdump sudo screen readline \
    postfix procmail mailx \
    logwatch \
    cvs bc at openssh-server nc which \
    gpg distcache libmcrypt lm_sensors mhash mod_ssl net-snmp \
    net-snmp-libs ntp sysstat yum-utils ;\
  yum install -y \
    epel-release mutt perl-Time-HiRes whitch ;\
  :;\
  chkconfig httpd on ;\
  chkconfig sshd on ;\
  :;\
  yum install -y git tig etckeeper ;\
  git config --global user.email "root@localhost.localdomain" ;\
  git config --global user.name "root" ;\
  etckeeper init ;\
  etckeeper commit init ;\
  yum remove -y epel-release ;\
  :;\
  yum update -y ;\
  yum clean all ;\
  echo "[info] done."

ENTRYPOINT ["/sbin/init"]

