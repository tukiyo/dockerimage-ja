docker build -t devel .

docker run --rm -it \
 -h devel.local \
 -v /tmp/.X11-unix:/tmp/.X11-unix \
 devel
