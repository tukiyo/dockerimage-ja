FROM ubuntu-debootstrap:15.10

RUN \
  unlink /etc/localtime ;\
  ln -s /usr/share/zoneinfo/Japan /etc/localtime ;\
  locale-gen ja_JP.UTF-8 ;\
  sed -i -e 's@http://archive@http://jp.archive@' /etc/apt/sources.list

RUN apt-get update -qq
RUN apt-get install -y -qq \
    git ruby ruby-dev sqlite3 libsqlite3-dev ruby-execjs build-essential

RUN apt-get install -y -qq \
    libicu-dev

RUN (cd /srv && git clone https://github.com/m-yamashita/lodge.git)
WORKDIR /srv/lodge
RUN cp -a config/database.example.yml config/database.yml
RUN sed -i \
      -e 's@#  adapter: sqlite3@  adapter: sqlite3@' \
      -e 's@#  encoding: utf8@  encoding: utf8@' \
      -e 's@#  pool: 5@  pool: 5@' \
      config/database.yml

RUN gem install bundler
RUN apt-get install -y zlib1g-dev cmake pkg-config
RUN bin/bundle install --path vendor/bundle

ENV SECRET_KEY_BASE b8c6ef9169409e5370b9859c321733c4ccb52235a2b5a64c0a6fb5d65960b59c56ae6f19b726202cee12436ab2d8c7d16190067574c1ccd005933f3292c47a6a
RUN sed -i -e '/to_sym/d' config/environments/production.rb
RUN bin/rake db:create RAILS_ENV=production
RUN bin/rake db:migrate RAILS_ENV=production

CMD bin/rails server -e production
