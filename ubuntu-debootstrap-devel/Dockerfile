FROM ubuntu-debootstrap:15.10

RUN \
  unlink /etc/localtime ;\
  ln -s /usr/share/zoneinfo/Japan /etc/localtime ;\
  locale-gen ja_JP.UTF-8 ;\
  sed -i -e 's@http://archive@http://jp.archive@' /etc/apt/sources.list

RUN apt-get update -qq
RUN apt-get install -y -qq \
    ssh curl apache2 build-essential vim tmux screen tig ranger w3m nkf
RUN mkdir /workspace && chmod 777 /workspace

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install -y -qq \
    coffeescript npm rails php5 mongodb mysql-client mysql-server python-pip \
    sqlite3 phpmyadmin ruby-dev python-dev golang openjdk-7-jre \
    postfix mutt mailutils sharutils \
    tightvncserver stone jq fonts-takao telnet zsh \
    man-db manpages-ja manpages-ja-dev ack-grep ansible puppet

RUN usermod -d /var/lib/mysql mysql &&\
    mysql_install_db

ENV SHELL /bin/bash
VOLUME ["/home/vagrant"]
EXPOSE 22 80 8000
CMD service ssh start &&\
    service dbus start &&\
    service avahi-daemon start &&\
    ip a | grep "inet " &&\
    echo "ssh user:pass = vagrant:vagrant" &&\
    tail -f -n0 /var/log/dmesg

RUN useradd vagrant -d /home/vagrant -m -s /bin/bash &&\
    (echo "vagrant:vagrant" | chpasswd) &&\
    (echo "vagrant ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/vagrant)

RUN apt-get install -y -qq avahi-daemon

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install -y -qq xfce4 firefox firefox-locale-ja vim-gtk \
    fcitx-mozc bash-completion
RUN (echo alias open='thunar' >> /home/vagrant/.bashrc)

RUN install --mode=600 -o vagrant /home/vagrant/.ssh &&\
    (curl -q https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub \
      > /home/vagrant/.ssh/authorized_keys) &&\
    chmod 600 /home/vagrant/.ssh/authorized_keys &&\
    chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys

#RUN wget -O /opt/sublime-text_build-3083_amd64.deb http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb
#RUN dpkg -i /opt/sublime-text_build-3083_amd64.deb


# docker run -it -d --name dev -h dev.local tukiyo3/ubuntu-dev
# docker logs dev
# wget -o ~/.ssh/id_rsa.vagrant https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant
# ssh vagrant@dev.local -i ~/.ssh/id_rsa.vagrant
