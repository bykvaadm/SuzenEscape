FROM bash
ARG FLAG

RUN adduser -D suzen && apk add --no-cache git 
WORKDIR /home/suzen
RUN  git config --global user.email "den@example.com" && \
     git config --global user.name "Den"

ADD hello /bin/hello
RUN git init && \
    git checkout -b flag_is_here && \
    echo "Now you are on another branch, this changes wont affect your develop until you merge it. Flag is $FLAG" > diary.txt && \
    git add . && git commit -m 'FLAG is here' && \
    git checkout -b master && \
    echo 'Your task is to select the branch with flag, there you will find the flag.' > diary.txt && \
    git add . && git commit -m 'There is no flag here'
    
RUN chown -R suzen /home/suzen/.git && \
    chmod -R 775 /home/suzen/.git
WORKDIR /home/suzen
USER suzen

ENTRYPOINT ["/bin/hello"]
