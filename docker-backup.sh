#!/bin/sh
set -eu
if [ ! $# -eq 3 ];then
  echo "$0 CONTAINER_NAME tar_name DIRECTORY"
  exit 1
fi

set -x
docker run --rm \
  --volumes-from $1 \
  -v $(pwd):/backup \
  busybox tar cf /backup/$2 $3
