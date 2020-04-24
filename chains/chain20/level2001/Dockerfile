FROM bykva/busybinaries

ARG FLAG

COPY hello /bin
RUN adduser -D suzen
COPY diary.txt /home/suzen
ENV SmthImportant="${FLAG}"
WORKDIR /home/suzen

ENTRYPOINT ["/bin/hello"]