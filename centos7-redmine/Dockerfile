FROM tukiyo3/centos7-devel

RUN echo "-------- yum --------"
RUN yum install -y vim wget tar gem rubygem-bundler
RUN yum install -y {ImageMagick,mariadb,httpd,curl}-devel
RUN yum install -y mariadb-server httpd
RUN echo "-------- mariadb --------"
RUN echo '[mysqld]' > /etc/my.cnf.d/my_custom.cnf
RUN echo 'character-set-server = utf8' >> /etc/my.cnf.d/my_custom.cnf
RUN ln -s /usr/lib/systemd/system/mariadb.service /etc/systemd/system/multi-user.target.wants/
RUN /usr/libexec/mariadb-prepare-db-dir
RUN echo "-------- redmine --------"
RUN cd /opt
RUN wget http://www.redmine.org/releases/redmine-2.6.0.tar.gz
RUN tar xzf redmine-2.6.0.tar.gz
RUN rm redmine-2.6.0.tar.gz
RUN ln -s /opt/redmine-2.6.0 /opt/redmine
RUN cd /opt/redmine
RUN echo "-------- bundler --------"
RUN echo 'gem: --no-ri --no-rdoc' > ~/.gemrc
RUN bundle install
RUN bundle clean
RUN echo "-------- httpd --------"
RUN gem install passenger
RUN yes | passenger-install-apache2-module
RUN ln -s $(find /usr/local/share/gems/gems/ -maxdepth 1 -type d -name "passenger*") /opt/passenger
RUN ln -s /usr/lib/systemd/system/httpd.service /etc/systemd/system/multi-user.target.wants/
RUN echo "-------- clean --------"
RUN yum clean all

ADD redmine.conf /etc/httpd/conf.d/
