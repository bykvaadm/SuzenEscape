#!/usr/bin/env bash

IFS=$'\n'
for string in $(docker ps --format='{{.Image}} {{.ID}}' | egrep -o 'suzen[[:digit:]]+.*'); do
  name=$(echo ${string} | awk -F: '{print $1}')
  tag=$(echo ${string} | awk '{print $1}' | awk -F: '{print $2}')
  id=$(echo ${string} | awk '{print $2}')
  /opt/susenescape/${name} ${id} ${tag}
done