FROM bash
ARG FLAG

RUN adduser -D suzen && apk add --no-cache git 
ADD hello /bin/hello
ADD suzen /home/suzen
WORKDIR /home/suzen
RUN git config --global user.email "den@example.com" && \
    git config --global user.name "Den" && \
    git init && chmod +x suzen && ./suzen ${FLAG:0:15} ${FLAG:15:15} ${FLAG:30:15} ${FLAG:45:15} && rm suzen && \
    chown -R suzen /home/suzen/.git && \
    chmod -R 775 /home/suzen/.git
WORKDIR /home/suzen
USER suzen

ENTRYPOINT ["/bin/hello"]
