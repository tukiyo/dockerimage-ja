FROM tukiyo3/centos5-1st

RUN \
  exec >& /root/build-centos5-mine.log ;\
  set -eux ;\
  :;\
  wget -O /opt/git-2.3.0.tar.gz https://www.kernel.org/pub/software/scm/git/git-2.3.0.tar.gz ;\
  tar xzf /opt/git-2.3.0.tar.gz -C /opt ;\
  (cd /opt/git-2.3.0 && ./configure && make all && make install) ;\
  rm -r /opt/git-2.3.0* ;\
  :;\
  wget -O /opt/stone-2.3e.tar.gz http://www.gcd.org/sengoku/stone/stone-2.3e.tar.gz ;\
  tar xzf /opt/stone-2.3e.tar.gz -C /opt ;\
  (cd /opt/stone*/ && sed -i -e 's@-DUSE_EPOLL@-DUSE_EPOLL -D_GNU_SOURCE@' Makefile && make linux && mv -f stone /usr/local/bin/) ;\
  rm -rf /opt/stone*
