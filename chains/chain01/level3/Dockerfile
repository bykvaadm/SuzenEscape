FROM bykva/busybinaries

ARG USERNAME
ARG CONFIG
ARG USERHOME
ARG FLAG

ADD hello /bin
RUN adduser -D suzen
ADD -diary.txt- /home/suzen/
RUN sed -i "s/FLAG/${FLAG}/g" /home/suzen/-diary.txt- \
    && cd /bin && ls | egrep -v "hello" | egrep -vw "(${CONFIG})" | xargs rm
WORKDIR /home/suzen

CMD ["/bin/hello"]
