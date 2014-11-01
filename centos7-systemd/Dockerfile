FROM centos:centos7

RUN \
  exec >& /root/build-systemd.log ;\
  set -eux ;\
  yum swap -y fakesystemd systemd initscripts epel-release vim ;\
  unlink /etc/localtime ;\
  ln -s /usr/share/zoneinfo/Japan /etc/localtime ;\
  localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 ;\
  rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm ;\
  yum clean all ;\
  echo ;\
  echo "export HOME=/root" > /root/.bashrc ;\
  echo "export EDITOR=vim" >> /root/.bashrc ;\
  echo "export LANG=ja_JP.UTF-8" >> /root/.bashrc ;\
  echo "alias ls='ls --color'" >> /root/.bashrc ;\
  echo "alias vi='vim -p'" >> /root/.bashrc ;\
  echo "alias vim='vim -p'" >> /root/.bashrc ;\
  echo ;\
  echo "set smartindent" > /root/.vimrc ;\
  echo "set nowrapscan" >> /root/.vimrc ;\
  echo "set nowrap" >> /root/.vimrc ;\
  echo "set nu" >> /root/.vimrc ;\
  echo "colorscheme desert" >> /root/.vimrc ;\
  echo "highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22" >> /root/.vimrc ;\
  echo "highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52" >> /root/.vimrc ;\
  echo "highlight DiffChange cterm=bold ctermfg=10 ctermbg=17" >> /root/.vimrc ;\
  echo "highlight DiffText   cterm=bold ctermfg=10 ctermbg=21" >> /root/.vimrc ;\
  echo ;\
  echo "[user]" > /root/.gitconfig ;\
  echo "	email = root@localhost.localdomain" >> /root/.gitconfig ;\
  echo "	name = root" >> /root/.gitconfig ;\
  echo "[info] done."

ENTRYPOINT ["/sbin/init"]
