#!/usr/bin/env bash

args=$@
if [ -z "$args" ] || [ ! -d "$args" ]; then
  echo "projects you can choose are "
  for dir in */; do
    echo "${dir}"
  done
  exit 1
fi

cd "$args"
sbt run
cd ..
