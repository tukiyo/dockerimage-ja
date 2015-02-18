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
    net-snmp-libs ntp sysstat yum-utils \
    hwdata pciutils ruby ruby-libs virt-what \
    man man-pages-ja \
    mutt postfix-pflogsumm ;\
  :;\
  chkconfig httpd on ;\
  chkconfig postfix on ;\
  chkconfig sshd on ;\
  :;\
  yum install -y epel-release ;\
  yum install -y git tig etckeeper ack ;\
  git config --global user.email "root@localhost.localdomain" ;\
  git config --global user.name "root" ;\
  etckeeper init ;\
  etckeeper commit init ;\
  yum remove -y epel-release ;\
  :;\
  yum update -y ;\
  yum clean all ;\
  echo "[info] done."

RUN \
  exec >& /root/build-centos5-git2.5.log ;\
  set -eux ;\
  yum install -y \
    curl-devel expat-devel gettext-devel openssl-devel zlib-devel ;\
  wget -O git-2.3.0.tar.gz https://www.kernel.org/pub/software/scm/git/git-2.3.0.tar.gz ;\
  tar xzf /opt/git-2.3.0.tar.gz -C /opt ;\
  (cd /opt/git-2.3.0 && ./configure && make all && make install) ;\
  rm -r /opt/git-2.3.0* ;\
  yum clean all

ENTRYPOINT ["/sbin/init"]
