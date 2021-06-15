FROM bash

ARG CONFIG
ARG FLAG

ADD hello /bin/hello

RUN adduser -D suzen         
ADD diary.txt /home/suzen

RUN echo "alias !key! = "${FLAG}"" >> home/suzen/.bashrc

USER suzen
WORKDIR /home/suzen

CMD ["/bin/hello"]

#Данный уровень проверяет знает ли пользователь где хранятся alias.