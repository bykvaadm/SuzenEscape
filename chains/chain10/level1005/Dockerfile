FROM bash
ARG FLAG

RUN adduser -D suzen && apk add --no-cache git 
WORKDIR /home/suzen
RUN  git config --global user.email "den@example.com" && \
     git config --global user.name "Den"

ADD hello /bin/hello
WORKDIR /home/suzen
ADD suzen /home/suzen
RUN git init && chmod +x suzen && ./suzen ${FLAG:0:7} ${FLAG:7:7} ${FLAG:14:7} ${FLAG:21:7} && rm suzen
RUN chown -R suzen /home/suzen/.git && \
    chmod -R 775 /home/suzen/.git
WORKDIR /home/suzen
USER suzen

ENTRYPOINT ["/bin/hello"]
