FROM tukiyo3/centos7-devel

RUN \
  exec >& /root/build-redmine.log ;\
  set -eux ;\
  echo "-------- yum --------" ;\
  yum install -y vim wget tar gem rubygem-bundler ;\
  yum install -y {ImageMagick,mariadb,httpd,curl}-devel ;\
  yum install -y mariadb-server httpd ;\
  echo "-------- mariadb --------" ;\
  echo '[mysqld]' > /etc/my.cnf.d/my_custom.cnf ;\
  echo 'character-set-server = utf8' >> /etc/my.cnf.d/my_custom.cnf ;\
  ln -s /usr/lib/systemd/system/mariadb.service /etc/systemd/system/multi-user.target.wants/ ;\
  /usr/libexec/mariadb-prepare-db-dir ;\
  echo "-------- redmine --------" ;\
  cd /opt ;\
  wget http://www.redmine.org/releases/redmine-2.6.0.tar.gz ;\
  tar xzf redmine-2.6.0.tar.gz ;\
  rm redmine-2.6.0.tar.gz ;\
  ln -s /opt/redmine-2.6.0 /opt/redmine ;\
  cd /opt/redmine ;\
  echo "-------- bundler --------" ;\
  echo 'gem: --no-ri --no-rdoc' > ~/.gemrc ;\
  bundle install ;\
  bundle clean ;\
  echo "-------- httpd --------" ;\
  gem install passenger ;\
  yes | passenger-install-apache2-module ;\
  ln -s $(find /usr/local/share/gems/gems/ -maxdepth 1 -type d -name "passenger*") /opt/passenger ;\
  ln -s /usr/lib/systemd/system/httpd.service /etc/systemd/system/multi-user.target.wants/ ;\
  echo "-------- clean --------" ;\
  yum clean all

ADD redmine.conf /etc/httpd/conf.d/
