FROM bykva/busybinaries

ARG USERNAME
ARG CONFIG
ARG USERHOME
ARG FLAG

ADD hello /bin
RUN adduser -D suzen \
    && cd /bin && ls | egrep -v "hello" | egrep -vw "(${CONFIG})" | xargs rm
ADD diary.txt /home/suzen
RUN echo "${FLAG}" >> /home/suzen/diary.txt
WORKDIR /home/suzen

CMD ["/bin/hello"]
