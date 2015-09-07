FROM ruby:slim

RUN \
  unlink /etc/localtime ;\
  ln -s /usr/share/zoneinfo/Japan /etc/localtime ;\
  sed -i -e 's@http://archive@http://jp.archive@' /etc/apt/sources.list
RUN apt-get update -qq
RUN apt-get install -y -qq \
  git locales build-essential libicu-dev cmake pkg-config libsqlite3-dev ruby-execjs
RUN locale-gen ja_JP.UTF-8

RUN (cd /srv && git clone https://github.com/m-yamashita/lodge.git)
WORKDIR /srv/lodge

RUN cp -a config/database.example.yml config/database.yml
RUN sed -i \
  -e 's@#  adapter: sqlite3@  adapter: sqlite3@' \
  -e 's@#  encoding: utf8@  encoding: utf8@' \
  -e 's@#  pool: 5@  pool: 5@' \
  config/database.yml
RUN bundle install --path vendor/bundle
ENV SECRET_KEY_BASE b8c6ef9169409e5370b9859c321733c4ccb52235a2b5a64c0a6fb5d65960b59c56ae6f19b726202cee12436ab2d8c7d16190067574c1ccd005933f3292c47a6a
ENV LODGE_THEME lodge
RUN rake db:create RAILS_ENV=production

# I wan't use mail service.
RUN sed -i -e '/to_sym/d' config/environments/production.rb

RUN rake db:migrate RAILS_ENV=production
RUN (echo "now = Time.now" > db/seeds.rb &&\
     echo "User.create(email: 'admin@localhost.localdomain', name: 'admin', password: 'changeme!', confirmed_at: now)" >> db/seeds.rb)
RUN rake db:seed RAILS_ENV=production
CMD rails server -e production
