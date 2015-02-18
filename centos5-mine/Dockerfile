FROM centos:centos5

RUN \
  exec >& /root/build-centos5.log ;\
  set -eux ;\
  :;\
  sed -i -e 's/^ZONE/#ZONE/g' -e '1i ZONE="Asia/Tokyo"' /etc/sysconfig/clock ;\
  /usr/sbin/tzdata-update ;\
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
  yum install -y epel-release ;\
  yum install -y git tig etckeeper ack ;\
  git config --global user.email "root@localhost.localdomain" ;\
  git config --global user.name "root" ;\
  etckeeper init ;\
  etckeeper commit init ;\
  yum remove -y epel-release ;\
  :;\
  yum install -y \
    curl-devel expat-devel gettext-devel openssl-devel zlib-devel ;\
  :;\
  yum update -y ;\
  yum clean all ;\
  :;\
  cp -a /etc/profile.d/krb5-devel.sh /etc/profile.d/nsenter.sh ;\
  /bin/sed -i -e 's@/usr/kerberos@:@g' /etc/profile.d/nsenter.sh ;\
  /bin/sed -i -e 's@PATH=:@PATH=@' /etc/profile.d/nsenter.sh ;\
  chmod +x /etc/profile.d/nsenter.sh ;\
  :;\
  mkdir /root/.ssh ;\
  curl https://github.com/tukiyo.keys > /root/.ssh/authorized_keys ;\
  chmod 600 /root/.ssh/authorized_keys

RUN \
  wget -O /opt/git-2.3.0.tar.gz https://www.kernel.org/pub/software/scm/git/git-2.3.0.tar.gz ;\
  tar xzf /opt/git-2.3.0.tar.gz -C /opt ;\
  (cd /opt/git-2.3.0 && ./configure && make all && make install) ;\
  rm -r /opt/git-2.3.0* ;\
  :;\
  wget -O /opt/stone-2.3e.tar.gz http://www.gcd.org/sengoku/stone/stone-2.3e.tar.gz ;\
  tar xzf /opt/stone-2.3e.tar.gz -C /opt ;\
  (cd /opt/stone*/ && sed -i -e 's@-DUSE_EPOLL@-DUSE_EPOLL -D_GNU_SOURCE@' Makefile && make linux && mv -f stone /usr/local/bin/) ;\
  rm -rf /opt/stone*

RUN \
  echo "#!/bin/sh" >> /startup.sh ;\
  for s in sshd rsyslog postfix httpd crond anacron ;\
  do \
    echo "/sbin/service $s start" >> /startup.sh ;\
  done ;\
  echo "tail -f /dev/null" >> /startup.sh ;\
  chmod +x /startup.sh

ENTRYPOINT /startup.sh
