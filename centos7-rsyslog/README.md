# usage

    mkdir $HOME/rsyslog

    docker run --privileged -it -d \
      -p 514:514/udp \
      -p 514:514/tcp \
      -p 8080:80 \
      -v $HOME/rsyslog:/var/log/rsyslog \
      --name rsyslog \
      tukiyo3/centos7-rsyslog
