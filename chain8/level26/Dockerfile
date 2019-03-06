FROM bash

ARG FLAG

RUN adduser -D suzen
ADD flag.tar.gz /home/suzen

RUN sed -i "11iFIRST_FLAG_PART: ${FLAG:0:10}" /home/suzen/flag && \
    sed -i "$(($(wc -l /home/suzen/flag | awk '{print $1}')*3/4))iSECOND_FLAG_PART: ${FLAG:10:10}" /home/suzen/flag && \
    sed -i "$(($(wc -l /home/suzen/flag | awk '{print $1}')-12))iTHIRD_FLAG_PART: ${FLAG:20:8}" /home/suzen/flag

ADD hello /bin/hello

ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen
