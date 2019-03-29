FROM alpine

ARG FLAG

RUN mkdir -p /home/suzen/ \
    && echo "this is password for next level" > /home/suzen/.${FLAG}

ADD hello /bin/hello

ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen
