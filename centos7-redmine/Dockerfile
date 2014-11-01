FROM tukiyo3/centos7-devel

RUN \
    exec >& /root/build-redmine.log ;\
    set -eux ;\
    echo "-------- yum --------" ;\
        yum install -y vim wget tar gem rubygem-bundler vlgothic-fonts ;\
        yum install -y {ImageMagick,mariadb,httpd,curl}-devel ;\
        yum install -y mariadb-server httpd ;\
    echo "-------- mariadb --------" ;\
        ln -s /usr/lib/systemd/system/mariadb.service /etc/systemd/system/multi-user.target.wants/ ;\
        /usr/libexec/mariadb-prepare-db-dir ;\
    echo "-------- redmine --------" ;\
        cd /opt ;\
        wget http://www.redmine.org/releases/redmine-2.6.0.tar.gz ;\
        tar xzf redmine-2.6.0.tar.gz ;\
        rm redmine-2.6.0.tar.gz ;\
        ln -s /opt/redmine-2.6.0 /opt/redmine ;\
    echo "-------- bundler --------" ;\
        cd /opt/redmine ;\
        bundle install --no-ri --no-rdoc ;\
    echo "-------- httpd --------" ;\
        gem install passenger ;\
        yes | passenger-install-apache2-module ;\
        ln -s $(find /usr/local/share/gems/gems/ -maxdepth 1 -type d -name "passenger*") /opt/passenger ;\
        ln -s /usr/lib/systemd/system/httpd.service /etc/systemd/system/multi-user.target.wants/ ;\
    echo "-------- clean --------" ;\
        chown -R apache:apache /opt/redmine ;\
        yum clean all

ADD files/my_custom.cnf /etc/my.cnf.d/

ADD files/database.yml /opt/redmine/config/
ADD files/configuration.yml /opt/redmine/config/

ADD files/redmine.conf /etc/httpd/conf.d/

ADD files/initialize.sh /opt/redmine/

EXPOSE 80
ENTRYPOINT ["/opt/redmine/initialize.sh"]
