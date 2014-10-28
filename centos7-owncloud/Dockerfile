FROM tukiyo3/centos7-lampp

RUN \
  exec >& /root/build-lampp.log ;\
  set -eux ;\
  echo ;\
  wget -O /etc/yum.repos.d/isv_ownCloud_community.repo \
    http://download.opensuse.org/repositories/isv:ownCloud:community/CentOS_CentOS-7/isv:ownCloud:community.repo ;\
  yum install -y owncloud ;\
  yum clean all
