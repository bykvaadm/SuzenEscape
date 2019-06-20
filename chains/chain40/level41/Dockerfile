FROM debian

ARG CONFIG
ARG FLAG

SHELL ["/bin/bash", "-c"]

RUN apt-get clean && apt-get update && \
    apt-get install -qy  vim

RUN mkdir -p /home/suzen

ADD kladovka  /home/suzen
ADD data  /home/suzen
ADD hello /bin
ADD diary.txt /home/suzen

CMD ["/bin/hello"]

WORKDIR /home/suzen

RUN echo "alias 0ec8c0c91c5235833c21cea143eac034='echo "part2: ${FLAG:10:12}"'" >> /etc/bash.bashrc 
RUN touch file31 | echo  "part1: ${FLAG:0:10}" > file31 
