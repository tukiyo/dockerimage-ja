FROM centos:centos7

# systemd
RUN \
  exec >& /root/build-systemd.log ;\
  set -eux ;\
  yum swap -y fakesystemd systemd initscripts epel-release ;\
  unlink /etc/localtime ;\
  ln -s /usr/share/zoneinfo/Japan /etc/localtime ;\
  localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 ;\
  yum clean all

# rsyslog
RUN \
  exec >& /root/build-rsyslog.log ;\
  set -eux ;\
  yum install -y rsyslog nginx crontabs ;\
  ln -s /usr/lib/systemd/system/nginx.service /etc/systemd/system/multi-user.target.wants/ ;\
  echo '10 0 * * * gzip $(find /var/log/rsyslog -type f -name "*.log" -mtime +3)' > /var/spool/cron/root ;\
  chmod 600 /var/spool/cron/root ;\
  yum clean all

ADD rsyslog/custom.conf /etc/rsyslog.d/
ADD nginx/custom_mime.conf /etc/nginx/conf.d/
ADD nginx/nginx.conf /etc/nginx/
EXPOSE 80
EXPOSE 514/tcp
EXPOSE 514/udp
ENTRYPOINT ["/sbin/init"]
