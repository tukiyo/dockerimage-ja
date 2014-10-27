FROM tukiyo3/centos7:systemd

RUN \
  exec >>& /root/build.log ;\
  set -eux ;\
  yum install -y ansible git tig vim-enhanced screen openssh-server net-tools ack wget sudo ;\
  yum clean all
