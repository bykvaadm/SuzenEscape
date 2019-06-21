FROM bash

ARG FLAG

RUN adduser -D suzen

WORKDIR /home/suzen

RUN for i in `seq 1 1000`; do mkdir ${i}; cd ${i}; done && \
    cd /home/suzen && \
    for i in `seq 1 677`;do cd ${i}; done && \
    echo "$FLAG" > diary.txt && \
    cd /sbin && ls | xargs rm && rm -rf /bin/*

COPY hello /bin

ENTRYPOINT ["/bin/hello"]
USER suzen
