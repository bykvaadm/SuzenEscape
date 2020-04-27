FROM bykva/busybinaries

COPY hello /bin
RUN adduser -D suzen \
    && cd /home/suzen \
    && echo "Flag is None" > flag

ARG CONFIG

RUN cd /bin \
    && ls | egrep -v "hello" | egrep -vw "(${CONFIG})" | xargs rm
COPY diary.txt /home/suzen

ARG FLAG

ENV flag="${FLAG}"
WORKDIR /home/suzen

ENTRYPOINT ["/bin/hello"]
