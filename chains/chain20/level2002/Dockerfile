FROM bykva/busybinaries

ARG CONFIG
ARG FLAG


COPY hello /bin
RUN adduser -D suzen
COPY diary.txt /home/suzen/
COPY async_gens.py /home/suzen/

WORKDIR /home/suzen

ENTRYPOINT ["/bin/hello"]