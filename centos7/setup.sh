unlink /etc/localtime
ln -s /usr/share/zoneinfo/Japan /etc/localtime
localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
echo "export LANG=ja_JP.UTF-8" > /.bashrc
cp -a rpm-gpg/* /etc/pki/rpm-gpg/
cp -a yum.repos.d/* /etc/yum.repos.d/
