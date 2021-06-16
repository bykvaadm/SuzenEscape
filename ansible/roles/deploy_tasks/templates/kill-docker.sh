#!/bin/bash
{% raw %}
docker ps --format='{{.ID}}' | \
  xargs -n 1 -r docker inspect -f '{{.ID}} {{.State.Running}} {{.State.StartedAt}} {{.Name}}' | \
{% endraw %}
  grep suzen | egrep -v '{{ deploy_tasks_kill_docker_regexp }}' | \
  awk '$2 == "true" && $3 <= "'$(date -d '30 minutes ago' -Ins --utc | sed 's/+00:00/Z/')'" {print $1}' | \
  xargs -r docker kill && \
  docker system prune -f
