FROM bash

ARG FLAG

RUN mkdir /home/suzen && \
    cd /home/suzen && \
    for i in `seq 1 1000`; do mkdir ${i}; cd ${i}; done && \
    cd /home/suzen && \
    for i in `seq 1 677`;do cd ${i}; done && \
    echo "$FLAG" > diary.txt && \
    cd /sbin && ls | xargs rm && rm -rf /bin/*

ADD hello /bin

WORKDIR /home/suzen
ENTRYPOINT ["bash"]
