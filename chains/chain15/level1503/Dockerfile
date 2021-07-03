FROM bash

ARG FLAG

RUN adduser -D suzen

WORKDIR /home/suzen

ADD hello /bin/hello
ADD diary.txt /home/suzen/diary.txt

RUN echo ${FLAG} >> flag.txt && \
    apk add zip unzip && \
    zip 1.zip flag.txt && rm -f flag.txt && \
    for i in $(seq 999); do zip $((i+1)).zip $i.zip && rm -f $i.zip; done

USER suzen

ENTRYPOINT ["/bin/hello"]
