FROM bash
ARG FLAG
ARG USERNAME
ARG CONFIG

RUN adduser -D suzen && apk add --no-cache git 
ADD hello /bin/hello
ADD suzen /home/suzen
WORKDIR /home/suzen
RUN git config --global user.email "den@example.com" && \
    git config --global user.name "Den" && \
    git init && chmod +x suzen && ./suzen $FLAG && rm suzen && \
    chown -R suzen /home/suzen/.git && \
    chmod -R 775 /home/suzen/.git && \
    cd /bin && ls | egrep -v "hello" | egrep -vw "(${CONFIG})" | xargs rm
WORKDIR /home/suzen
USER suzen

ENTRYPOINT ["/bin/hello"]
