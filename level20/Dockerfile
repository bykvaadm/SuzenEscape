FROM bash

RUN adduser -D john && adduser -D suzen && \
    bash -c "mkdir -p /home/john/Desktop/{films,music}/ololo" && \
    bash -c "mkdir -p /home/john/Documents/{films,music}/azaza" && \
    bash -c "touch /home/john/{file1,file2,file3}"
ADD hello /bin/hello

ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen
