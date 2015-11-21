docker build -t devel .
docker run --rm -t -i -v /tmp/.X11-unix:/tmp/.X11-unix devel
