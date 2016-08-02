FROM centos:6

RUN \
  yum install -y \
    gcc gcc-c++ glibc ncurses-devel make rpm-build wget tar git \
  && yum clean all \
  && install -d /root/rpmbuild/SPECS /root/rpmbuild/SOURCES

WORKDIR /root/rpmbuild/SOURCES

RUN \
  wget -q http://dbstudy.info/mysql/4.0.30/mysql-4.0.30.tar.gz \
  && tar xzf mysql-4.0.30.tar.gz \
  && rm -f mysql-4.0.30.tar.gz

WORKDIR /root/rpmbuild/SOURCES/mysql-4.0.30
RUN \
  ./configure --prefix=/opt/mysql --with-charset=ujis --with-extra-charsets=sjis \
  && make -s \
  && make install

RUN \
  yum install -y gettext \
  && rpm -ivh https://raw.githubusercontent.com/tukiyo/mysql4.0.30.el6/master/rpmbuild/RPMS/x86_64/checkinstall-20150420-1.x86_64.rpm \
  && ln -s /usr/local/lib/installwatch.so /usr/local/lib64/installwatch.so \
  && checkinstall -y -R --pkgname=opt-mysql4 \
  && ls -lh /root/rpmbuild/RPMS/x86_64/*.rpm

VOLUME /root/rpmbuild/RPMS/x86_64/
