FROM bykva/busybinaries

ARG CONFIG
ARG FLAG


COPY hello /bin
RUN adduser -D suzen \
    && cd /bin \
    && ls | egrep -v "hello" | egrep -vw "(${CONFIG})" | xargs rm
COPY diary.txt /home/suzen/
COPY async_gens.py /home/suzen/

WORKDIR /home/suzen

ENTRYPOINT ["/bin/hello"]
