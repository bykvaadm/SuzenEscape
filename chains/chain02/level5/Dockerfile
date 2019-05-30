FROM bykva/busybinaries as busybinaries

ARG CONFIG
RUN cd /bin && ls | egrep -vw "(${CONFIG})" | xargs rm

FROM bash

ARG USERNAME
ARG USERHOME
ARG FLAG

RUN mkdir /home/suzen && \
    rm -rf /sbin/* && \
    rm -rf /usr/bin/* && \
    rm -rf /usr/sbin/* && \
    rm -rf /bin/*

COPY --from=busybinaries /bin /bin/
ADD hello /bin

ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen
