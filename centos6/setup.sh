unlink /etc/localtime
ln -s /usr/share/zoneinfo/Japan /etc/localtime
localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
echo "export LANG=ja_JP.UTF-8" > /.bashrc
cp -a ./repo/*.repo /etc/yum.repos.d/
