FROM centos:centos6

RUN \
  yum install -y \
    gcc gcc-c++ glibc ncurses-devel make rpm-build wget tar git \
  && yum clean all \
  && install -d /root/rpmbuild/SPECS /root/rpmbuild/SOURCES

WORKDIR /root/rpmbuild/SOURCES

RUN \
  wget -q http://dbstudy.info/mysql/4.0.30/mysql-4.0.30.tar.gz \
  && tar xzf mysql-4.0.30.tar.gz \
  && rm -f mysql-4.0.30.tar.gz \
  && mv mysql-4.0.30* .

WORKDIR /root/rpmbuild/SOURCES/mysql-4.0.30
RUN \
  ./configure --prefix=/opt/mysql \
  && make -s \
  && make install
