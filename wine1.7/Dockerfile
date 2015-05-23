FROM ubuntu-debootstrap:vivid

RUN set -eux ;\
    apt-get update ;\
    apt-get install -y software-properties-common ;\
    add-apt-repository ppa:ubuntu-wine/ppa ;\
    dpkg --add-architecture i386 ;\
    apt-get update ;\
    apt-get install -y wine1.7 ;\
    apt-get clean
