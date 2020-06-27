FROM bash as bash

ARG FLAG

ADD flag.tar.gz /

RUN sed -i "15i1) FLAG_PART: ${FLAG:0:9}" /flag && \
    sed -i "$(($(wc -l /flag | awk '{print $1}')*5/8))i2) FLAG_PART: ${FLAG:9:10}" /flag && \
    sed -i "$(($(wc -l /flag | awk '{print $1}')-15))i3) FLAG_PART: ${FLAG:19:9}" /flag

FROM bykva/busybinaries

RUN adduser -D suzen

ARG CONFIG

COPY --from=bash /flag /home/suzen
COPY diary.txt /home/suzen


RUN cd /bin && ls | egrep -vw "(${CONFIG})" | xargs rm

ADD hello /bin/hello

ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen
