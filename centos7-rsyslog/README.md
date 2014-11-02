# usage

## create data container

    FROM busybox
    VOLUME /var/log/rsyslog
    ENTRYPOINT tail -f /dev/null

    docker build -t private/data:rsyslog .

## run data container

    docker run -d --name data_rsyslog private/data:rsyslog

## run rsyslog container
    
    docker run --privileged -it -d \
      --name rsyslog \
        --volumes-from data_rsyslog tukiyo3/centos7-rsyslog


# rsyslog (sender)

/etc/rsyslog.conf

    *.* @@(z9)192.168.100.4:514

    or 

    *.* @@(z9)rsyslog:514
