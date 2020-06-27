FROM bykva/busybinaries
SHELL ["/bin/bash", "-c"]
ARG CONFIG
ARG FLAG
COPY hello /bin
RUN adduser -D suzen \
    && cd /home/suzen \
    && echo "Flag is @#*@*##%*#${FLAG:0:9}**##%&*@&*${FLAG:9:10}**&#@&#@%*${FLAG:19:9}*#&@%%#*&@" > flag \
    && cd /bin \
    && ls | egrep -v "hello" | egrep -vw "(${CONFIG})" | xargs rm

COPY diary.txt /home/suzen

WORKDIR /home/suzen

ENTRYPOINT ["/bin/hello"]
