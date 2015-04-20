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
