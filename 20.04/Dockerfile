FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive

RUN echo 'apt-get update -qq && apt-get install -yq $@ && apt-get clean && rm -rf /var/lib/apt/lists/*' > /usr/local/bin/pkgadd.sh \
 && chmod +x /usr/local/bin/pkgadd.sh

# locale
RUN ln -s -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
 && pkgadd.sh fonts-vlgothic sudo locales \
 && locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8

# add user
ARG DOCKER_UID=1000
ARG DOCKER_USER=ubuntu
ARG DOCKER_PASSWORD=ubuntu
RUN useradd -m \
  --uid ${DOCKER_UID} --groups sudo --shell /bin/bash ${DOCKER_USER} \
 && echo ${DOCKER_USER}:${DOCKER_PASSWORD} | chpasswd \
 && echo "${DOCKER_USER} ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
ENV HOME /home/${DOCKER_USER}
WORKDIR ${HOME}

# fix: setrlimit error when using sudo
RUN echo "Set disable_coredump false" > /etc/sudo.conf

# X
ENV DISPLAY :0.0
VOLUME /tmp/.X11-unix

ENV TZ=Asia/Tokyo
# fcitx
ENV GTK_IM_MODULE=fcitx \
    QT_IM_MODULE=fcitx \
    XMODIFIERS=@im=fcitx \
    DefalutIMModule=fcitx

USER ${DOCKER_USER}
