FROM centos:centos7

RUN yum -y groupinstall "Development Tools" && \
    yum install -y openssl-devel readline-devel zlib-devel curl-devel \
        libyaml-devel libffi-devel mariadb-server mariadb-devel \
        ImageMagick ImageMagick-devel ipa-pgothic-fonts && \
    yum clean all

WORKDIR /opt
RUN curl -O http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.2.tar.gz
RUN tar xzf ruby-2.2.2.tar.gz && rm ruby-2.2.2.tar.gz

WORKDIR /opt/ruby-2.2.2
RUN ./configure --disable-install-doc
RUN make 
RUN make install
RUN yum install -y hostname

WORKDIR /opt/
RUN rm -rf /opt/ruby-2.2.2
RUN gem install bundler --no-rdoc --no-ri
RUN echo "[mysqld]" >> /etc/my.cnf && \
    echo "character-set-server=utf8" >> /etc/my.cnf && \
    echo "[mysql]" >> /etc/my.cnf && \
    echo "default-character-set=utf8" >> /etc/my.cnf
RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql/
RUN yum install -y epel-release
RUN yum install -y supervisor
RUN echo "[program:mysqld_safe]" > tmp &&\
    echo "command=/usr/bin/mysqld_safe" >> tmp &&\
    echo "user=mysql" >> tmp &&\
    echo "autorestart=true" >> tmp &&\
    mv tmp /etc/supervisord.d/mysqld_safe.ini
RUN curl -O http://www.redmine.org/releases/redmine-3.0.3.tar.gz &&\
    tar xvf redmine-3.0.3.tar.gz &&\
    ln -s redmine-3.0.3 redmine

WORKDIR /opt/redmine
RUN echo "production:" > a.yml &&\
    echo "  adapter: mysql2" >> a.yml &&\
    echo "  database: test" >> a.yml &&\
    echo "  host: localhost" >> a.yml \
    echo "  username: root" >> a.yml &&\
    echo "  password: ''" >> a.yml &&\
    echo "  encoding: utf8" >> a.yml &&\
    mv a.yml config/database.yml
RUN bundle install --without development test --path vendor/bundle
RUN bundle exec rake generate_secret_token
RUN supervisord ;\
    RAILS_ENV=production bundle exec rake db:migrate ;\
    RAILS_ENV=production REDMINE_LANG=ja bundle exec rake redmine:load_default_data
