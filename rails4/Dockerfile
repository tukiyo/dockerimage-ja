FROM rails

RUN \
  unlink /etc/localtime ;\
  ln -s /usr/share/zoneinfo/Japan /etc/localtime ;\
  sed -i -e 's@http://archive@http://jp.archive@' /etc/apt/sources.list ;\
  apt-get update -qq ;\
  apt-get install -y -qq locales ;\
  locale-gen ja_JP.UTF-8 ;\
  apt-get clean

WORKDIR /tmp
COPY ./app/Gemfile Gemfile
COPY ./app/Gemfile.lock Gemfile.lock
RUN bundle install

ADD ./app /app
WORKDIR /app

VOLUME /app
EXPOSE 3000
