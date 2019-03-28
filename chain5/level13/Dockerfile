FROM alpine

ARG FLAG

RUN mkdir /home/suzen && \
    echo "${FLAG}" > /home/suzen/diary.txt

ADD hello /bin/hello

ENTRYPOINT ["/usr/bin/vi", "/bin/hello"]

WORKDIR /home/suzen
