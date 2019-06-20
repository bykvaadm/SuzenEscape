FROM bash
ARG FLAG
ARG USERNAME
ARG CONFIG

WORKDIR /home/suzen
ADD hello /bin/hello

RUN adduser -D suzen && apk add --no-cache git && \
    git config --global user.email "den@example.com" && \
    git config --global user.name "Den" && \
    git init && \
    git checkout -b flag_is_here && \
    echo "Now you are on another branch, this changes wont affect your develop until you merge it. Flag is ${FLAG:0:30}(/)${FLAG:30:15}(!)${FLAG:45:15}" > diary.txt && \
    git add . && git commit -m 'FLAG is here' && \
    git checkout -b master && \
    echo 'Your task is to select the branch with flag, there you will find the flag.' > diary.txt && \
    git add . && git commit -m 'There is no flag here' && \
    chown -R suzen /home/suzen/.git && \
    chmod -R 775 /home/suzen/.git

RUN cd /bin && ls | egrep -v "hello" | egrep -vw "(${CONFIG})" | xargs rm
WORKDIR /home/suzen
USER suzen

ENTRYPOINT ["/bin/hello"]
