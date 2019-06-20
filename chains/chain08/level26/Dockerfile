FROM bash as bash

ARG FLAG

ADD flag.tar.gz /

RUN sed -i "11iFIRST_FLAG_PART: ${FLAG:0:20}" /flag && \
    sed -i "$(($(wc -l /flag | awk '{print $1}')*3/4))iSECOND_FLAG_PART: ${FLAG:20:20}" /flag && \
    sed -i "$(($(wc -l /flag | awk '{print $1}')-12))iTHIRD_FLAG_PART: ${FLAG:40:20}" /flag

FROM bykva/busybinaries

RUN adduser -D suzen

ARG CONFIG

COPY --from=bash /flag /home/suzen

RUN cd /bin && ls | egrep -vw "(${CONFIG})" | xargs rm

ADD hello /bin/hello

ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen
