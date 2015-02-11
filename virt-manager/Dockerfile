FROM tukiyo3/ubuntu-debootstrap

RUN \
  set -eux ;\
  apt-get update -qq ;\
  echo "## install packages ------------------" ;\
  apt-get install --no-install-recommends -y \
    tightvncserver fonts-mona xterm \
    openssh-server openssh-client ssh-askpass \
    blackbox eterm \
    xserver-xorg-core xfonts-base \
    virt-manager hicolor-icon-theme \
    net-tools telnet ;\
  echo "## vnc setting -----------------------" ;\
  mkdir /root/.vnc/ ;\
  echo VncP@ss | vncpasswd -f > /root/.vnc/passwd ;\
  chmod 600 /root/.vnc/passwd ;\
  echo "## vnc xstartup ----------------------" ;\
  echo "setxkbmap -model jp106 -layout jp" >> /root/.vnc/xstartup ;\
  echo "blackbox &" >> /root/.vnc/xstartup ;\
  echo "xterm &" >> /root/.vnc/xstartup ;\
  echo "virt-manager &" >> /root/.vnc/xstartup ;\
  chmod +x /root/.vnc/xstartup ;\
  echo "## startup.sh ------------------------" ;\
  echo "export USER=root" > /startup.sh ;\
  echo "export LANG=ja_JP.UTF-8" >> /startup.sh ;\
  echo "vncserver -geometry 1280x800 :0" >> /startup.sh ;\
  echo "echo vnc server running 5900 port." >> /startup.sh ;\
  echo "echo default password: VncP@ss" >> /startup.sh ;\
  echo "tail -f /dev/null" >> /startup.sh ;\
  chmod +x /startup.sh ;\
  echo "## cache clear -----------------------" ;\
  mv /etc/apt/sources.list /etc/apt/sources.list.bak ;\
  apt-get clean ;\
  apt-get update ;\
  mv /etc/apt/sources.list.bak /etc/apt/sources.list ;\
  echo "done"

CMD sh /startup.sh
