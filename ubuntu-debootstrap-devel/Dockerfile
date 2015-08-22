FROM ubuntu-debootstrap:15.10

RUN \
  unlink /etc/localtime ;\
  ln -s /usr/share/zoneinfo/Japan /etc/localtime ;\
  locale-gen ja_JP.UTF-8 ;\
  sed -i -e 's@http://archive@http://jp.archive@' /etc/apt/sources.list

RUN apt-get update -qq
RUN apt-get install -y -qq \
    ssh curl apache2 build-essential vim tmux screen tig ranger w3m nkf
RUN mkdir /root/.ssh && \
    (curl -q https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub \
         > /root/.ssh/authorized_keys) &&\
    chmod 600 /root/.ssh/authorized_keys
RUN curl https://github.com/tukiyo.keys -o /root/.ssh/authorized_keys
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

#RUN update-rc.d ssh defaults

ENV SHELL /bin/bash
WORKDIR /workspace
VOLUME ["/workspace"]
CMD /etc/init.d/rc 2 && ip a s | grep "inet " && tail -f -n0 /var/log/dmesg
EXPOSE 22 80 443 3306 8000 8080 3389 5901 5902

RUN useradd vagrant -d /home/vagrant -m -s /bin/bash &&\
    cp -a /root/.ssh /home/vagrant/ &&\
    chown -R vagrant:vagrant /home/vagrant/.ssh &&\
    (echo "vagrant ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/vagrant)


#RUN sed -i.org -e 's/Port 22/Port 10022/' /etc/ssh/sshd_config

# docker run -it -d --name dev vagrant/ubuntu-dev
# docker logs dev
# ssh vagrant@ipaddr