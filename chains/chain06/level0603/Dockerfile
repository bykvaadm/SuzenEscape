FROM alpine

ARG FLAG

RUN mkdir -p /home/suzen/ \
    && addgroup ${FLAG} \
    && addgroup `whoami` ${FLAG}

ADD hello /bin/hello

ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen
