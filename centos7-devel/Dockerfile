FROM tukiyo3:centos7-systemd

RUN \
  exec >& /root/build-systemd.log ;\
  set -eux ;\
  yum install -y "Development Tools" ;\
  yum install -y ruby-devel ;\
  yum clean all
