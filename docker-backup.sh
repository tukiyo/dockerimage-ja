#!/bin/sh
set -eux
if [ ! $# -eq 3 ];then
  echo "$0 CONTAINER_NAME tar_name DIRECTORY"
  exit 1
fi

docker run --rm \
  --volumes-from $1 \
  -v $(pwd):/backup \
  busybox tar cf /backup/$2 $3
# busybox tar cf /backup/app.tar /app
