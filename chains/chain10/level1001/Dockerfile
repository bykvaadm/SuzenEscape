FROM bash

ARG FLAG

RUN adduser -D suzen && apk add --no-cache git 
WORKDIR /home/suzen
RUN  git config --global user.email "den@example.com" && \
     git config --global user.name "Den"

RUN git init && \
    echo ${FLAG:0:10}/${FLAG:10:10}/${FLAG:20:8} > diary.txt && git add . && git commit -m 'FLAG is here' &&\
    echo 'Flag was here, but someone removed it, try to see it logs' > diary.txt
#ADD suzen.tar.gz /home/suzen
RUN chown -R suzen /home/suzen/.git && \
    chmod -R 775 /home/suzen/.git 
USER suzen
ADD hello /bin/hello

ENTRYPOINT ["/bin/hello"]
