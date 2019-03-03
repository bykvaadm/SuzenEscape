FROM bash

ARG FLAG

RUN adduser -D suzen && \
    echo ${FLAG} > /home/suzen/flag

ADD hello /bin/hello

ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen
