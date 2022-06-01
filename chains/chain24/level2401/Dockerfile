FROM alpine:3.9

RUN apk add curl && \
    adduser -D suzen && \
    rm -rf /sbin/* && \
    rm -rf /usr/sbin/*

ADD diary.txt /home/suzen/
ADD hello /bin

ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen
