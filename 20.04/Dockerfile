FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive

RUN echo 'apt-get update -qq && apt-get install -yq $@ && apt-get clean && rm -rf /var/lib/apt/lists/*' > /usr/local/bin/pkgadd.sh \
 && chmod +x /usr/local/bin/pkgadd.sh

# locale
RUN ln -s -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
 && pkgadd.sh fonts-vlgothic sudo locales \
 && locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8

# create user ubuntu (uid:gid = 1000:1000)
ENV USER ubuntu
ENV HOME /home/${USER}
WORKDIR ${HOME}
RUN export uid=1000 gid=1000 \
 && echo "${USER}:x:${uid}:${gid}:Developer,,,:${HOME}:/bin/bash" >> /etc/passwd \
 && echo "${USER}:x:${uid}:" >> /etc/group \
 && echo "${USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
 && chmod -R ${uid}:${gid} ${HOME}

# X
ENV DISPLAY :0.0
VOLUME /tmp/.X11-unix

VOLUME ${HOME}
USER ${USER}
