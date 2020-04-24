FROM bykva/busybinaries

ARG CONFIG
ARG FLAG


COPY hello /bin

RUN adduser -D suzen \
    && cd /bin \
    && ls | egrep -v "hello" | egrep -vw "(${CONFIG})" | xargs rm \
    && cd /home/suzen/ \
    && echo "${FLAG}" \
    | sed "s/Y/\&\&/g" \
    | sed "s/a/@/g" \
    | sed "s/B/\!\!\!/g" \
    | sed "s/X/#/g" \
    | sed "s/h/ Hello Friend /g" > flag

COPY diary.txt /home/suzen/

WORKDIR /home/suzen

ENTRYPOINT ["/bin/hello"]
