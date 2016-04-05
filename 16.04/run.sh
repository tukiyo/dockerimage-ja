docker run -ti --rm \
  -e XMODIFIERS \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v `pwd`:/home/vagrant/ \
  tukiyo3/gui
