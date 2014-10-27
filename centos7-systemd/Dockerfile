FROM centos:centos7

RUN \
  exec >& /root/build-systemd.log ;\
  set -eux ;\
  yum swap -y fakesystemd systemd initscripts epel-release ;\
  unlink /etc/localtime ;\
  ln -s /usr/share/zoneinfo/Japan /etc/localtime ;\
  localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 ;\
  rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm ;\
  yum clean all ;\
  cat > /root/.bashrc <<...
export HOME=/root
export EDITOR=vim
export LANG=ja_JP.UTF-8
alias ls='ls --color'
alias vi='vim -p'
alias vim='vim -p'
... ;\
  cat > /root/.vimrc <<...
set smartindent
set nowrapscan
set nowrap
set num
colorscheme desert
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21
... ;\
  cat > /root/.gitconfig <<...
[user]
	email = root@localhost.localdomain
	name = root
... ;\
  echo "[info] done."

ENTRYPOINT ["/sbin/init"]
