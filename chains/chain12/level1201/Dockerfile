FROM bykva/busybinaries
ARG CONFIG
ARG FLAG
COPY hello /bin
RUN adduser -D suzen \
    && cd /home/suzen \
    && echo "Flag is @#*@*##%*#$(echo $FLAG | cut -c1-9)**##%&*@&*$(echo $FLAG | cut -c10-19)**&#@&#@%*$(echo $FLAG | cut -c20-28)*#&@%%#*&@" > flag \
    && cd /bin \
    && ls | egrep -v "hello" | egrep -vw "(${CONFIG})" | xargs rm

COPY diary.txt /home/suzen

WORKDIR /home/suzen

ENTRYPOINT ["/bin/hello"]
