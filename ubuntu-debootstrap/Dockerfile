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
  apt-get install -y vim-tiny dialog ;\
  echo "## cache clear -----------------------" ;\
  mv /etc/apt/sources.list /etc/apt/sources.list.bak ;\
  apt-get clean ;\
  apt-get update ;\
  mv /etc/apt/sources.list.bak /etc/apt/sources.list ;\
  echo "done"
