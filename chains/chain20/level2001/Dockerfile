FROM bykva/busybinaries

ARG FLAG

ADD hello /bin
RUN adduser -D suzen
ADD diary.txt /home/suzen
ENV flag="${FLAG}"
WORKDIR /home/suzen

CMD ["/bin/hello"]