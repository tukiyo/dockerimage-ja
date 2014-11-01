FROM tukiyo3/centos7-devel

RUN \
    exec >& /root/build-redmine.log ;\
    set -eux ;\
    echo "-------- yum --------" ;\
        yum install -y vim wget tar sudo gem rubygem-bundler vlgothic-fonts ;\
        yum install -y {ImageMagick,mariadb,httpd,curl}-devel ;\
        yum install -y mariadb-server httpd ;\
        sed -i -e "s/^Defaults    requiretty/#Defaults    requiretty/" /etc/sudoers ;\
    echo "-------- mariadb --------" ;\
        echo '[mysqld]' > /etc/my.cnf.d/my_custom.cnf ;\
        echo 'character-set-server = utf8' >> /etc/my.cnf.d/my_custom.cnf ;\
        ln -s /usr/lib/systemd/system/mariadb.service /etc/systemd/system/multi-user.target.wants/ ;\
        /usr/libexec/mariadb-prepare-db-dir ;\
        sudo -u mysql /usr/bin/mysqld_safe --basedir=/usr \& ;\
    echo "-------- redmine --------" ;\
        cd /opt ;\
        wget http://www.redmine.org/releases/redmine-2.6.0.tar.gz ;\
        tar xzf redmine-2.6.0.tar.gz ;\
        rm redmine-2.6.0.tar.gz ;\
        ln -s /opt/redmine-2.6.0 /opt/redmine ;\
    echo "-------- bundler --------" ;\
        cd /opt/redmine ;\
        echo 'gem: --no-ri --no-rdoc' > ~/.gemrc ;\
        bundle install ;\
        bundle clean ;\
    echo "-------- httpd --------" ;\
        gem install passenger ;\
        yes | passenger-install-apache2-module ;\
        ln -s $(find /usr/local/share/gems/gems/ -maxdepth 1 -type d -name "passenger*") /opt/passenger ;\
        ln -s /usr/lib/systemd/system/httpd.service /etc/systemd/system/multi-user.target.wants/ ;\
    echo "-------- config --------" ;\
        echo 'production:' > /opt/redmine/config/database.yml ;\
        echo '  adapter: mysql2' >> /opt/redmine/config/database.yml ;\
        echo '  database: redmine' >> /opt/redmine/config/database.yml ;\
        echo '  host: localhost' >> /opt/redmine/config/database.yml ;\
        echo '  username: root' >> /opt/redmine/config/database.yml ;\
        echo '  password: ""' >> /opt/redmine/config/database.yml ;\
        echo '  encoding: utf8' >> /opt/redmine/config/database.yml ;\
        echo ;\
        echo 'production:' >> /opt/redmine/config/configuration.yml ;\
        echo '  email_delivery:' >> /opt/redmine/config/configuration.yml ;\
        echo '    delivery_method: :smtp' >> /opt/redmine/config/configuration.yml ;\
        echo '    smtp_settings:' >> /opt/redmine/config/configuration.yml ;\
        echo '      address: "localhost"' >> /opt/redmine/config/configuration.yml ;\
        echo '      port: 25' >> /opt/redmine/config/configuration.yml ;\
        echo '      domain: 'redmine.localdomain'' >> /opt/redmine/config/configuration.yml ;\
        echo '  rmagick_font_path: /usr/share/fonts/vlgothic/VL-Gothic-Regular.ttf' >> /opt/redmine/config/configuration.yml ;\
    echo "-------- database --------" ;\
        mysqladmin create redmine ;\
        bundle exec rake generate_secret_token ;\
        RAILS_ENV=production bundle exec rake db:migrate ;\
        mysqladmin shutdown ;\
    echo "-------- clean --------" ;\
        chown -R apache:apache /opt/redmine ;\
        yum clean all

ADD redmine.conf /etc/httpd/conf.d/
