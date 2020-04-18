FROM bykva/busybinaries

# sed "s/[ ]*#.*//g" async_gens.py > answer.py

ARG CONFIG
ARG FLAG


COPY hello /bin
RUN adduser -D suzen
COPY diary.txt /home/suzen/
COPY async_gens.py /home/suzen/

WORKDIR /home/suzen

ENTRYPOINT ["/bin/hello"]