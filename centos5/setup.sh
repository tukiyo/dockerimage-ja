unlink /etc/localtime
ln -s /usr/share/zoneinfo/Japan /etc/localtime
#
yum reinstall glibc-common
yum update
yum clean all
#
localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
mv /usr/lib/locale/ja* /tmp
mv /usr/lib/locale/en_US* /tmp
rm -rf /usr/lib/locale/*
mv /tmp/ja* /usr/lib/locale/
mv /tmp/en_US* /usr/lib/locale/
touch /usr/lib/locale/locale-archive
#
echo "export LANG=ja_JP.UTF-8" > /.bashrc
cp -a ./repo/*.repo /etc/yum.repos.d/
