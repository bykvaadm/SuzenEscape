FROM alpine

ARG FLAG

ADD hello /bin/hello
ADD diary.1 /

RUN apk update && apk add man \
    && sed -i "10a${FLAG}" /diary.1 \
    && mkdir -p /home/suzen/ && mkdir -p /usr/local/man/man8/ \
    && install -g 0 -o 0 -m 0644 diary.1 /usr/local/man/man8/ \
    && gzip /usr/local/man/man8/diary.1 \
    && rm /diary.1

ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen
