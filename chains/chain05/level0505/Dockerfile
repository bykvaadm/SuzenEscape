FROM bash

ARG FLAG

WORKDIR /home/suzen

ADD hello /bin/hello
ADD .hidden /home/suzen
COPY diary /home/suzen

RUN apk add file && \
    adduser -D suzen && \
    sed -i "s/INSERT_FLAG_HERE/${FLAG}/g" .hidden && \    
    xxd -p .hidden | tr -d '\n' | tee .hidden && \
    tar -cvjf  .archive .hidden && rm .hidden

USER suzen
ENTRYPOINT ["/bin/hello"]


#Solution
#tar -xf .archive
#echo -e `cat .hidden | sed 's/../\\\\x&/g'`

