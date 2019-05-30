FROM bykva/busybinaries

ARG USERNAME
ARG CONFIG
ARG USERHOME
ARG FLAG

ADD hello /bin
ADD ./.ash_history /home/suzen/.ash_history
RUN adduser -D suzen \
    && chown suzen /home/suzen/.ash_history \
    && echo $FLAG >> /home/suzen/.ash_history \
    && cd /bin && ls | egrep -v "hello" | egrep -vw "(${CONFIG})" | xargs rm

WORKDIR /home/suzen
USER suzen
CMD ["/bin/hello"]
