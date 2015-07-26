FROM ubuntu-debootstrap:latest

RUN \
  set -eux ;\
  echo "## localize --------------------------" ;\
  unlink /etc/localtime ;\
  ln -s /usr/share/zoneinfo/Japan /etc/localtime ;\
  locale-gen ja_JP.UTF-8 ;\
  echo "## mirror ----------------------------" ;\
  sed -i -e 's@http://archive@http://jp.archive@' /etc/apt/sources.list ;\
  apt-get update -qq ;\
  apt-get install -y cron screen vim w3m curl wget nkf ruby nodejs docker.io ack-grep ;\
  ln -s /usr/bin/nodejs /usr/bin/node ;\
  wget https://github.com/docker/compose/releases/download/1.3.3/docker-compose-`uname -s`-`uname -m` -O /usr/local/bin/docker-compose ;\
  chmod +x /usr/local/bin/docker-compose ;\
  echo "## cache clear -----------------------" ;\
  mv /etc/apt/sources.list /etc/apt/sources.list.bak ;\
  apt-get clean ;\
  apt-get update ;\
  mv /etc/apt/sources.list.bak /etc/apt/sources.list ;\
  echo "done"
