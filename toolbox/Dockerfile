FROM ubuntu-debootstrap:latest

RUN \
  set -eux &&\
  echo "## localize --------------------------" &&\
  echo "Asia/Tokyo" > /etc/timezone &&\
  dpkg-reconfigure --frontend noninteractive tzdata &&\
  locale-gen ja_JP.UTF-8 &&\
  echo "## mirror ----------------------------" &&\
  sed -i -e 's@http://archive@http://jp.archive@' /etc/apt/sources.list &&\
  apt-get update -qq &&\
  apt-get install -y cron screen vim w3m curl wget nkf ruby nodejs docker.io ack-grep mysql-server &&\
  ln -s /usr/bin/nodejs /usr/bin/node &&\
  apt-get install -y python ranger python-pip &&\
  wget https://github.com/docker/compose/releases/download/1.3.3/docker-compose-`uname -s`-`uname -m` -O /usr/local/bin/docker-compose &&\
  chmod +x /usr/local/bin/docker-compose &&\
  echo "## settings -----------------------" &&\
  apt-get clean &&\
  echo "done"

RUN \
  cp -a /usr/share/zoneinfo/Japan /etc/localtime &&\
  apt-get install -y tig python-dev manpages-ja manpages-ja-dev bash-completion autossh openssh-server &&\
  pip install ansible &&\
  update-alternatives --install /bin/sh sh /bin/bash 1 &&\
  update-alternatives --install /usr/bin/editor editor /usr/bin/vim 100 &&\
  echo -e "sy on\nse hlserch\nse nowrapscan\nse wrap\ncolorscheme desert" > /root/.vimrc &&\
  echo "source /etc/bash_completion" > /root/.bash_profile &&\
  echo "done"
