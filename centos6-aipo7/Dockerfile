FROM centos:centos6

RUN \
  exec >& /root/build-aipo7.log ;\
  set -eux ;\
  yum install -y tar sudo ;\
  sed -i -e "s/^Defaults    requiretty/#Defaults    requiretty/" /etc/sudoers ;\
  yum install -y make gcc readline-devel zlib-devel nmap wget bison flex ;\
  cd /usr/local ;\
  wget -q https://aipo.googlecode.com/files/aipo7020ja_linux64.tar.gz ;\
  tar xzf aipo7020ja_linux64.tar.gz ;\
  tar xzf aipo7020ja_linux/aipo7020.tar.gz ;\
  rm -rf aipo7020ja_linux* ;\
  cd /usr/local/aipo/bin ;\
  sh installer.sh > /dev/null ;\
  wget -q http://iij.dl.sourceforge.jp/aipo/60038/holidays_default.properties \
       -O /usr/local/aipo/tomcat/webapps/aipo/WEB-INF/conf/holidays_default.properties ;\
  yum clean all


WORKDIR /usr/local/aipo/bin/
ENTRYPOINT ./startup.sh && tail -f /dev/null
