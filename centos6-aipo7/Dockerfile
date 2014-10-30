FROM centos:centos6

RUN \
  exec >& /root/build-aipo7.log ;\
  yum install -y tar sudo ;\
  yum install -y make gcc readline-devel zlib-devel nmap wget ;\
  cd /usr/local/src ;\
  wget -q https://aipo.googlecode.com/files/aipo7020ja_linux64.tar.gz ;\
  tar xzf aipo7020ja_linux64.tar.gz ;\
  tar xzf aipo7020ja_linux/aipo7020.tar.gz ;\
  rm -rf aipo7020ja_linux* ;\
  cd /usr/local/src/aipo/bin ;\
  sh installer.sh > /dev/null ;\
  yum clean all

ENTRYPOINT ["/usr/local/src/aipo/bin/startup.sh"]
