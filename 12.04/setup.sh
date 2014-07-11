unlink /etc/localtime
ln -s /usr/share/zoneinfo/Japan /etc/localtime
echo "export LANG=ja_JP.UTF-8" > /.bashrc
cp -a ./sources.list /etc/apt/
locale-gen ja_JP.UTF-8
