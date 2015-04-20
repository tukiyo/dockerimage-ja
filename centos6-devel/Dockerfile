FROM centos:centos6

RUN \
  exec >& /root/build-centos6.log ;\
  set -eux ;\
  :;\
  yum install -y \
    gcc gcc-c++ glibc ncurses-devel make rpm-build wget tar git ;\
  yum clean all ;\
  :;\
  install -d /root/rpmbuild/SPECS /root/rpmbuild/SOURCES

RUN \
  set -eux ;\
  :;\
  wget -q http://dbstudy.info/mysql/4.0.30/mysql-4.0.30.tar.gz ;\
  tar xzf mysql-4.0.30.tar.gz ;\
  mv mysql-4.0.30* /root/rpmbuild/SOURCES ;\
  (cd /root/rpmbuild/SOURCES/mysql-4.0.30/; ./configure --prefix=/opt/mysql; make -s) ;\
  echo "done"
