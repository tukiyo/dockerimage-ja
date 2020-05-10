docker run \
 -it --rm \
 -e XMODIFIERS \
 -v /tmp/.X11-unix:/tmp/.X11-unix \
 -v `pwd`:/home/ubuntu/ \
 tukiyo3/gui
