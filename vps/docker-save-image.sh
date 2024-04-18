#!/bin/bash

# A script to install save a Docker volume.
# Run it as root.

# Example command: `docker-save-volume.sh -v VOLUME`.

while getopts ":i:" opt; do
  case $opt in
    i)
      IMAGE="$OPTARG"
      ;;
    :)
      echo "Option -$OPTARG requires an argument."
      exit 1
      ;;
  esac
done

FILENAME="$IMAGE.tar"

docker image save $IMAGE > $FILENAME

# Check size of the archive
FILESIZE=$(stat -c%s "$FILENAME")
$FILESIZE
