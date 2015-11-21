FROM ubuntu-debootstrap:15.10

# ja
RUN \
  unlink /etc/localtime ;\
  ln -s /usr/share/zoneinfo/Japan /etc/localtime ;\
  locale-gen ja_JP.UTF-8 ;\
  sed -i -e 's@http://archive@http://jp.archive@' /etc/apt/sources.list

# update
RUN apt-get update -qq

RUN apt-get install -y -qq \
    ssh curl apache2 build-essential vim tmux screen tig ranger w3m nkf

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install -y -qq \
      tightvncserver stone jq fonts-takao telnet fizsh \
      man-db manpages-ja manpages-ja-dev ack-grep ansible \
      avahi-daemon \
      xrdp \
      xfce4-terminal xfce4-screenshooter \
      firefox firefox-locale-ja vim-gtk fcitx-mozc \
      thunderbird-locale-ja \
      language-pack-ja \
      language-pack-ja-base \
      \
      lubuntu-lxpanel-icons \
      lubuntu-artwork \
      lubuntu-artwork-15-10 \
      lubuntu-core \
      lubuntu-default-session \
      lubuntu-default-settings \
      lubuntu-icon-theme

RUN dpkg --add-architecture i386 &&\
    apt-get update -qq &&\
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y -qq \
      wine1.6-i386

# add vagrant user
RUN useradd vagrant -d /home/vagrant -m -s /usr/bin/fizsh &&\
    (echo "vagrant:vagrant" | chpasswd) &&\
    (echo "vagrant ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/vagrant)

RUN install --directory --mode=755 -o vagrant -g vagrant /home/vagrant/.fizsh &&\
    (echo alias open='pcmanfm' >> /home/vagrant/.fizsh/.fizshrc) &&\
    (echo export GTK_IM_MODULE=fcitx    >> /home/vagrant/.fizsh/.fizshrc) &&\
    (echo export QT_IM_MODULE=fcitx     >> /home/vagrant/.fizsh/.fizshrc) &&\
    (echo export XMODIFIERS="@im=fcitx" >> /home/vagrant/.fizsh/.fizshrc)

RUN install --directory --mode=700 -o vagrant -g vagrant /home/vagrant/.ssh &&\
    wget -O /home/vagrant/.ssh/authorized_keys \
      https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub &&\
    chmod 600 /home/vagrant/.ssh/authorized_keys &&\
    chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys

# env
USER vagrant
ENV SHELL /usr/bin/fizsh
ENV LANG=ja_JP.UTF-8
ENV DISPLAY :0.0
VOLUME ["/tmp/.X11-unix"]
EXPOSE 22
CMD sudo service dbus start &&\
    sudo service ssh start &&\
    sudo service xrdp start &&\
    ip a | grep "inet " &&\
    echo "ssh vagrant@ipaddr. pass:vagrant" &&\
    sudo tail -f -n0 /var/log/dmesg

    #sudo service avahi-daemon start &&\

# docker run -it -d --name dev -h dev.local tukiyo3/ubuntu-dev
# docker logs dev
# ssh vagrant@dev.local -i ~/.ssh/id_rsa.vagrant
