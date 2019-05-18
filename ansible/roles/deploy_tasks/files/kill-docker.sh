#!/bin/bash
docker ps --format='{{.ID}}' | \
  xargs -n 1 -r docker inspect -f '{{.ID}} {{.State.Running}} {{.State.StartedAt}} {{.Name}}' | \
  egrep -v '(ctfchecker|web|registry)' | \
  awk '$2 == "true" && $3 <= "'$(date -d '30 minutes ago' -Ins --utc | sed 's/+00:00/Z/')'" {print $1}' | \
  xargs -r docker kill && \
  docker system prune -f
