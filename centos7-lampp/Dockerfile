FROM tukiyo3/centos7-ansible

RUN \
  exec >& /root/build-lampp.log ;\
  set -eux ;\
  cd /tmp ;\
  git clone https://github.com/tukiyo/setup_centos7.git ;\
  cd /tmp/setup_centos7/first; ./run.sh ;\
  cd /tmp/setup_centos7/second; ./run.sh ;\
  cd /tmp/setup_centos7/lampp; ./run.sh ;\
  cd /tmp ;\
  rm -rf /tmp/setup_centos7 ;\
  yum clean all
