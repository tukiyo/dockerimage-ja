# usage

## 1. create data container

    FROM busybox
    VOLUME /var/log/rsyslog
    ENTRYPOINT tail -f /dev/null

    docker build -t private/data:rsyslog .

## 2. run data container

    docker run -d --name data_rsyslog private/data:rsyslog

## 3. run rsyslog container
    
    docker run --privileged -it -d \
      --name rsyslog \
      -p 514:514/udp -p 514:514/tcp -p 8080:80 \
      --volumes-from data_rsyslog tukiyo3/centos7-rsyslog


# rsyslog (sender)

/etc/rsyslog.conf

    *.* @@(z9)192.168.100.4:514

    or 

    *.* @@(z9)rsyslog:514
