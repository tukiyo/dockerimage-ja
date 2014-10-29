FROM tukiyo3/centos7-ja-systemd

RUN \
  exec >& /root/build-devel.log ;\
  set -eux ;\
  yum groupinstall -y "Development Tools" ;\
  yum install -y ruby-devel ;\
  yum clean all
