FROM tukiyo3/centos7-ja-systemd

RUN \
  exec >& /root/build-ansible.log ;\
  set -eux ;\
  yum install -y ansible git tig vim-enhanced screen openssh-server net-tools ack wget sudo psmisc ;\
  yum clean all
