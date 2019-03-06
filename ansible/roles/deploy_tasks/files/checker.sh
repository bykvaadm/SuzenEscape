#!/usr/bin/env bash

IFS=$'\n'
for string in $(docker ps --format='{{.Image}} {{.ID}}' | egrep -o 'suzen[[:digit:]]+ .*'); do
  name=$(echo ${string} | awk '{print $1}')
  id=$(echo ${string} | awk '{print $2}')
  /opt/susenescape/${name} ${id}
  #docker cp /opt/susenescape/${name} ${id}:/tmp
  #docker exec ${id} /tmp/${name}
  #docker exec ${id} rm -rf /tmp/*
done