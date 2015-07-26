#!/bin/sh

cat > ~/.toolboxrc <<EOF
TOOLBOX_DOCKER_IMAGE=tukiyo3/toolbox
TOOLBOX_DOCKER_TAG=latest
EOF

cat > ~/.bash_profile <<EOF
alias toolbox='toolbox --bind=/run:/run'
alias t='toolbox --bind=/run:/run'
EOF

echo "install screen command."
sudo wget -q https://raw.githubusercontent.com/tukiyo/coreos-screen.run/master/screen.run -O /usr/share/oem/screen.run
sudo sh /usr/share/oem/screen.run
