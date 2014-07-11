docker run \
 -i \
 -p 80:80 \
 -v $HOME/dockerimage-ja/:/root \
-t tukiyo3/ubuntu10.04-ja /bin/bash
#-t ubuntu:10.04 /bin/bash
# -t tukiyo3/centos7-ja /bin/bash
