FROM centos:centos5

RUN \
  exec >& /root/build-centos5-mine.log ;\
  set -eux ;\
  unlink /etc/localtime ;\
  ln -s /usr/share/zoneinfo/Japan /etc/localtime ;\
  localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 ;\
  yum install -y \
    php php-cli php-common php-devel php-mbstring php-mysql php-pdo \
    httpd httpd-devel \
    gd \
    nkf wget vim-enhanced w3m python-simplejson \
    make gcc perl-Time-HiRes \
    anacron crontabs vixie-cron \
    whitch zip unzip telnet tcpdump sudo screen ruby readline \
    postfix procmail mailx \
    logwatch \
    cvs bc at openssh-server nc ;\
  chkconfig httpd on ;\
  chkconfig sshd on ;\
  yum install -y ;\
  yum clean all ;\
  echo "[info] done."

ENTRYPOINT ["/sbin/init"]
