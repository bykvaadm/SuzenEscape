FROM docker

ARG CONFIG
ADD hello /bin/hello

RUN adduser -D suzen

ADD diary.txt /home/suzen


CMD ["/bin/hello"]

# Для решения данной задачи игроку требуется обратиться к серверу, при обращении тот отдает id контейнера.
# Дальше требуется подключиться к контейнеру при помощи команды docker exec -i -t <ID> bash

