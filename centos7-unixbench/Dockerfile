FROM centos:centos7

RUN \
  exec >& /root/build-unixbench.log ;\
  set -eux ;\
  curl -o /opt/UnixBench5.1.3.tgz https://byte-unixbench.googlecode.com/files/UnixBench5.1.3.tgz ;\
  yum install -y make gcc perl perl-Time-HiRes tar ;\
  tar xzf /opt/UnixBench5.1.3.tgz -C /opt ;\
  cd /opt/UnixBench ;\
  make ;\
  yum clean all

WORKDIR /opt/UnixBench
ENTRYPOINT ["./Run"]
