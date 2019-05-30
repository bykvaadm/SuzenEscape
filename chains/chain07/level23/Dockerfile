FROM bash

RUN adduser -D suzen && \
    bash -c "mkdir -p /home/suzen/{source,destination}" && \
    bash -c "touch /home/suzen/source/nginx{1..99}.log" && \
    for filename in 1 2 3 4 5; do echo suzen > /home/suzen/destination/nginx${filename}.log; done

ADD hello /bin/hello

ENTRYPOINT ["/bin/hello"]
WORKDIR /home/suzen
