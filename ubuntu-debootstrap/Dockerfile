FROM ubuntu-debootstrap:latest

RUN \
  set -eux ;\
  unlink /etc/localtime ;\
  ln -s /usr/share/zoneinfo/Japan /etc/localtime ;\
  locale-gen ja_JP.UTF-8 ;\
  apt-get update -qq ;\
  apt-get install -y vim-tiny dialog ;\
  mv /etc/apt/sources.list /etc/apt/sources.list.bak ;\
  apt-get clean ;\
  apt-get update ;\
  mv /etc/apt/sources.list.bak /etc/apt/sources.list ;\
  echo done
