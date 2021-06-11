FROM alpine

ARG FLAG

RUN mkdir -p /home/suzen/${FLAG}

ADD diary.txt /home/suzen/
ADD hello /bin/hello

ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen/${FLAG}
