FROM bash

ARG USERNAME
ARG CONFIG
ARG FLAG
ADD hello /bin/hello
WORKDIR /home/suzen
RUN adduser -D suzen && apk add --no-cache git && \
    git init && git config --global user.email "den@example.com" && git config --global user.name "Den" && \
    echo ${FLAG:0:20}/${FLAG:20:20}/${FLAG:40:20} > diary.txt && git add . && git commit -m 'FLAG is here' &&\
    echo 'Flag was here, but someone removed it, try to see it logs' > diary.txt && git add . && git commit -m 'Azaza I removed the flag' && \   
    chown -R suzen /home/suzen/.git && \
    chmod -R 775 /home/suzen/.git && \
    cd /bin && ls | egrep -v "hello" | egrep -vw "(${CONFIG})" | xargs rm

USER suzen



ENTRYPOINT ["/bin/hello"]

