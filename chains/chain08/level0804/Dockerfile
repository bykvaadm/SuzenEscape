FROM bykva/busybinaries

ARG USERNAME
ARG CONFIG
ARG USERHOME
ARG FLAG

ADD hello /bin
RUN adduser -D suzen \
    && cd /bin && ls | egrep -v "hello" | egrep -vw "(sh|ls|cd|cat|md5sum|mkdir)" | xargs rm

WORKDIR /home/suzen

CMD ["/bin/hello"]
