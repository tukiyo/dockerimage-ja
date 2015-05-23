FROM python:2
MAINTAINER tukiyo3 <tukiyo3@gmail.com>

RUN (cd /opt; git clone https://github.com/tukiyo/pysheng.git) ;\
    (cd /opt/pysheng; python setup.py install) ;\
    ln -s /usr/local/bin/python /usr/bin/python

WORKDIR /root
ENTRYPOINT /usr/local/bin/pysheng $@
