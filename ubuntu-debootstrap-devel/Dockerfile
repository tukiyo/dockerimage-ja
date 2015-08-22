FROM ubuntu-debootstrap:latest

RUN \
  unlink /etc/localtime ;\
  ln -s /usr/share/zoneinfo/Japan /etc/localtime ;\
  locale-gen ja_JP.UTF-8 ;\
  sed -i -e 's@http://archive@http://jp.archive@' /etc/apt/sources.list

RUN apt-get update -qq
RUN apt-get install -y \
    ssh curl apache2 build-essential vim tmux screen tig ranger w3m nkf
RUN mkdir /root/.ssh && \
    curl https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub \
         -o /root/.ssh/authorized_keys &&\
    chmod 600 /root/.ssh/authorized_keys
#RUN curl https://github.com/tukiyo.keys -o /root/.ssh/authorized_keys
RUN sed -i.org -e 's/Port 22/Port 10022/' /etc/ssh/sshd_config
RUN mkdir /workspace && chmod 777 /workspace

ENV SHELL /bin/bash
WORKDIR /workspace
VOLUME ["/workspace"]
CMD /etc/init.d/rc 2 && ip a s | grep "inet " && tail -f -n0 /var/log/dmesg
EXPOSE 22 80 443 8000 8080 3389 5901 5902

# docker run -it --net host ContainerID
